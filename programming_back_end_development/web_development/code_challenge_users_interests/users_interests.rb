require 'sinatra'
require 'sinatra/reloader'
require 'yaml'
require 'pry'

before do
  @users = YAML.load_file('users.yaml')
end

get "/:user" do
  redirect "/" unless @user = @users[params[:user].to_sym]
  erb :user
end

get "/" do
  erb :index
end

helpers do

  def count_interests(users)
    @total = users.each.map { |_, v| v[:interests].size }.reduce(:+)
  end
end
