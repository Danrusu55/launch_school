require 'sinatra'
require 'sinatra/reloader'

get "/form" do
  <<-HTML
  <form action="/submit" method="GET">
    <input type="text" name="email" />
    <button type="submit">Submit</button>
  </form>
  HTML
end

get "/submit" do
  params[:email]
end

get "/submit" do
  params[:email]
end
