require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'redcarpet'
require 'yaml'
require 'bcrypt'

configure do
  enable :sessions
  set :session_secret, 'secret'
  set :erb, :escape_html => true
end

before do
  session[:user] ||= false
end

helpers do

  def current_user?
    credentials = load_user_credentials
    credentials.key?(session[:username])
  end
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

def load_user_credentials
  credentials_path = if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/users.yml", __FILE__)
  else
    File.expand_path("../users.yml", __FILE__)
  end
  YAML.load_file(credentials_path)
end

def valid_credentials?(username, password)
  credentials = load_user_credentials

  if credentials.key?(username)
    hashed_password = BCrypt::Password.new(credentials[username])
    hashed_password == password
  else
    false
  end
end

def render_markdown text
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_file_content path
  @title = params[:file]
  content = File.read(path)
  if File.extname(path) == ".md"
    erb render_markdown content
  elsif File.extname(path) == ".txt"
    headers["Content-Type"] = "text/plain"
    content
  else
    session[:message] = "File does not exist"
    redirect "/"
  end
end

def user?
  if !current_user?
    session[:message] = "You must sign in to complete that task"
    redirect "/"
  else
    true
  end
end

get "/" do
  pattern = File.join(data_path, "*")
  @files = Dir.glob(pattern).map do |path|
    File.basename(path)
  end
  erb :index, layout: :layout
end

get "/users/signin" do
  erb :signin, layout: :layout
end

post "/users/signin" do
  username = params[:username]

  if valid_credentials?(username, params[:password])
    session[:username] = username
    session[:message] = "Welcome"
    redirect "/"
  else
    session[:message] = "Invalid credentials."
    erb :signin, layout: :layout
  end
end

post "/users/signout" do
  session[:username] = nil
  session[:password] = nil
  session[:message] = "You have been signed out"
  redirect "/"
end

get "/new" do
  user?
  erb :new_file, layout: :layout
end

get "/:file" do
  file_path = File.join(data_path, params[:file])

  if File.exist?(file_path)
    load_file_content file_path
  else
    session[:message] = "#{params[:file]} does not exist"
    redirect "/"
  end
end

get "/:file/edit" do
  user?
  file_path = File.join(data_path, params[:file])

  @filename = params[:file]
  @content = File.read(file_path)

  erb :edit
end

post "/create" do
  user?
  file = params[:filename].to_s

  file_path = File.join(data_path, file)

  if file.empty?
    session[:message] = "You must specify a name for the file."
    status 422
    erb :new
  elsif File.exist?(file_path)
    session[:message] = "File already exists with that name"
    status 422
    erb :new
  else
    File.write(file_path, "")

    session[:message] = "#{params[:filename]} has been created."
    redirect "/"
  end
end

post "/:file" do
  user?
  file_path = File.join(data_path, params[:file])

  File.write(file_path, params[:content])

  session[:message] = "#{params[:file]} has been updated."
  redirect "/"
end

post "/:file/delete" do
  user?
  file_path = File.join(data_path, params[:file])

  File.delete(file_path)

  session[:message] = "#{params[:file]} has been deleted."
  redirect "/"
end
