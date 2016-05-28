require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  @file_names = Dir.glob('public/*').map {|file_name| File.basename(file_name)}.sort
  @file_names.reverse! if params[:sort] == 'reverse'

  erb :index
end
