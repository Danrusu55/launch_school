# myapp.rb
require 'sinatra'

get '/foo', :agent => /(\d\.\d)[\d\/]*?/ do
  ":agent => #{params['agent']}"
end

get '/' do
  '<h1>Get</h1>'
end

post '/' do
  '<h1>Post</h1>'
end

put '/' do
  '<h1>Put</h1>'
end

patch '/' do
  '<h1>Patch</h1>'
end

delete '/' do
  '<h1>Delete</h1>'
end

options '/' do
  '<h1>Options</h1>'
end

link '/' do
  '<h1>Link</h1>'
end

unlink '/' do
  '<h1>Unlink</h1>'
end

get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
  "Hello #{params['name']}"
end

get '/hi/:name' do |n|
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
  # n stores params['name']
  "Hi #{n}"
end

get '/say/*/to/*' do
  # matchs /say/hello/to/world
  "#{params['splat']}"
end

get '/download/*.*' do
  # matches /download/path/to/file.xml
  "#{params['splat']}"
end

get /\A\/hello\/([\w]+)\z/ do
  "Hello, #{params['captures'].first}!"
end

get %r{/something/([\w]+)} do |c|
  # matches "Get /meta/hello/world"
  "Hello, #{c}"
end

get '/posts_one.?:format?' do
  # matches "GET /posts" and any extension "GET /posts.json", "GET /posts.xml" etc
end

get '/posts_two' do
  # matches "GET /posts?title=foo&author=bar"
  title = params['title']
  author = params['author']
  # uses title and author variables; query is optional to the /posts route
  "#{title} and #{author}"
end

