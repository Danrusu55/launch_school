ENV["RACK_ENV"] = "test"

require "minitest/autorun"
require "rack/test"
require "fileutils"

require_relative "../file_based_CMS"

class FileBasedCMSTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(data_path)
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def create_document(name, content= "")
    File.open(File.join(data_path, name), "w") do |file|
      file.write(content)
    end
  end

  def session
    last_request.env["rack.session"]
  end

  def admin_session
    { "rack.session" => { username: "admin" }}
  end

  def test_index
    create_document "about.md"
    create_document "changes.txt"

    get "/", {}, admin_session

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "changes.txt"
    assert_includes last_response.body, "Signed in as admin"
  end

  def test_viewing_text_document
    create_document "changes.txt", "Test"
    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "Test"
  end

  def test_not_a_document
    get "/not_a_file.txt", {}, admin_session

    assert_equal 302, last_response.status
    assert_includes "not_a_file.txt does not exist", session[:message]

    get last_response["Location"]

    assert_equal 200, last_response.status
  end

  def test_markdown_document_render
    create_document "about.md", "# Test"
    get "/about.md"
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]

    assert_includes last_response.body, "<h1>Test</h1>"
  end

  def test_editing_document
    create_document "changes.txt"
    get "/changes.txt/edit", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<textarea"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_updating_document
    post "/changes.txt", { content: "new content" }, admin_session

    assert_equal 302, last_response.status
    assert_includes "changes.txt has been updated.", session[:message]

    get last_response["Location"], {}, admin_session

    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new content"
  end
end

def test_deleting_document
  create_document("test.txt")

  post "/test.txt/delete", {}, admin_session

  assert_equal 302, last_response.status

  get last_response["Location"]
  assert_includes "test.txt has been deleted", session[:message]

  get "/"
  refute_includes last_response.body, "test.txt"
end

def test_view_new_document_form
  get "/new", {}, admin_session

  assert_equal 200, last_response.status
  assert_includes last_response.body, "<input"
  assert_includes last_response.body, %q(<button type="submit")
end

def test_create_new_document
  post "/create", { filename: "test.txt" }, admin_session
  assert_equal 302, last_response.status

  get last_response["Location"]
  assert_includes "test.txt has been created", session[:message]

  get "/"
  assert_includes last_response.body, "test.txt"
end

def test_create_new_document_without_filename
  post "/create", {}, admin_session, filename: ""
  assert_equal 422, last_response.status
  assert_includes "A name is required", session[:message]
end

def test_signin_form
  get "/users/signin"

  assert_equal 200, last_response.status
  assert_includes last_response.body, "<input"
  assert_includes last_response.body, %q(<button type="submit")
end

def test_signin
  post "/users/signin", username: "admin", password: "password"
  assert_equal 302, last_response.status

  get last_response["Location"]
  assert_includes "Welcome", session[:message]
  assert_includes last_response.body, "Signed in as admin"
end

def test_signin_with_bad_credentials
  post "users/signin", username: "guest", password: "wrong"
  assert_equal 422, last_response.status
  assert_equal nil, session[:username]
  assert_includes "Invalid credentials", session[:message]
end

def test_signout
  post "/users/signin", username: "admin", password: "password"
  get last_response["Location"]
  assert_includes "Welcome", session[:message]

  post "users/signout"
  get last_response["Location"]

  assert_equal nil, session[:username]
  assert_includes "You have been signed out", session[:message]
  assert_includes last_response.body, "Sign In"
end
