require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/content_for"
require "tilt/erubis"


configure do
  enable :sessions
  set :session_secret, 'secret'
end

helpers do
  def all_todos_completed? list
    todos_count(list) > 0 && number_todos_remaining(list) == 0
  end

  def list_class list
    "complete" if all_todos_completed? list
  end

  def todos_count list
    list[:todos].size
  end

  def number_todos_remaining list
    list[:todos].select { |todo| !todo[:completed] }.size
  end

  def todo_completed? todo
    todo[:completed]
  end

  def sort_lists(lists, &block)
    complete_lists, incomplete_lists = lists.partition { |list| all_todos_completed?(list) }

    incomplete_lists.each { |list| yield list, lists.index(list) }
    complete_lists.each { |list| yield list, lists.index(list) }
  end

  def sort_todos(todos, &block)
    complete_todos, incomplete_todos = todos.partition { |todo| todo_completed? todo }

    incomplete_todos.each { |todo| yield todo, todos.index(todo) }
    complete_todos.each { |todo| yield todo, todos.index(todo) }
  end
end

before do
  session[:lists] ||= []
end

get "/" do
  redirect "/lists"
end

# View list of lists
get "/lists" do
  @lists = session[:lists]
  erb :lists, layout: :layout
end

# Render the new list form
get "/lists/new" do
  erb :new_list, layout: :layout
end

# Render each list
get "/lists/:id" do
  @list_id = params[:id].to_i
  @list = session[:lists][@list_id]
  erb :list, layout: :layout
end

# Edit list name
get "/lists/:id/edit" do
  id = params[:id].to_i
  @list = session[:lists][id]
  erb :edit_list, layout: :layout
end

# Add a new todo to a list
post "/lists/:list_id/todos" do
  @list_id = params[:list_id].to_i
  @list = session[:lists][@list_id]
  text = params[:todo].strip

  error = error_for_todo(text)
  if error
    session[:error] = error
    erb :list, layout: :layout
  else
    @list[:todos] << {name: text, completed: false}
    session[:success] = "The todo was added"
    redirect "/lists/#{@list_id}"
  end
end

post "/lists/:id/todos/:index" do
  @list_id = params[:id].to_i
  @list = session[:lists][@list_id]
  is_completed = params[:completed] == "true"

  todo_id = params[:index].to_i
  todo = @list[:todos][todo_id]
  todo[:completed] = is_completed
  session[:success] = "The todo has been updated."
  redirect "/lists/#{@list_id}"
end

# Delete a todo item from list
post "/lists/:id/todos/:index/delete" do
  @list_id = params[:id].to_i
  @list = session[:lists][@list_id]

  todo_id = params[:index].to_i
  list[:todos].delete_at todo_id
  session[:success] = "Todo item was deleted."
  redirect "/lists/#{@list_id}"
end

# Complete all todos in a list
post "/lists/:id/complete_all" do
  @list_id = params[:id].to_i
  @list = session[:lists][@list_id]

  @list[:todos].map do |todo|
    todo[:completed] = true
  end
  session[:success] = "All todos completed."
  redirect "/lists/#{@list_id}"
end

# Create a new list
post "/lists" do
  list_name = params[:list_name].strip

  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    session[:lists] << {name: list_name, todos: []}
    session[:success] = "The list has been created."
    redirect "/lists"
  end
end

# Edit existing todo list
post "/lists/:id" do
  list_name = params[:list_name].strip
  @list = session[:lists][params[:id].to_i]

  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    @list[:name] = list_name
    session[:success] = "The list has been updated."
    redirect "/lists/#{params[:id].to_i}"
  end
end

# Delete todo list from todos
post "/lists/:id/delete" do
  id = params[:id].to_i
  session[:lists].delete_at id
  session[:success] = "The list has been deleted."
  redirect "/lists"
end

# Return an error message if the nama is invalid. Return nil if valid
def error_for_list_name(name)
  if !(1..100).cover? name.size
    "List name must be between 1 and 100 characters."
  elsif session[:lists].any? {|list| list[:name] == name}
    "List name must be unique."
  end
end

# Return an error message if the nama is invalid. Return nil if valid
def error_for_todo(name)
  if !(1..100).cover? name.size
    "Todo name must be between 1 and 100 characters."
  end
end