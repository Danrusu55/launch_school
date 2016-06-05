class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    if todo.class.to_s != "Todo"
      raise TypeError, "can only add Todo objects"
    end
    @todos << todo
  end

  def size
    @todos.size
  end

  def first
    @todos[0]
  end

  def last
    @todos[@todos.size - 1]
  end

  def item_at(index)
    check(index)
    @todos[index]
  end

  def mark_done_at(index)
    check(index)
    @todos[index].done!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    check(index)
    @todos.delete_at(index)
  end

  def each
    count = 0
    while count < @todos.size
      yield(@todos[count]) if block_given?
      count += 1
    end
    self
  end

  def select(name='')
    new_list = TodoList.new(name)
    @todos.each do |todo|
      if yield(todo)
        new_list.add(todo)
      end
    end
    new_list
  end

  def find_by_title(search_string)
    each do |todo|
      return todo if todo.title.include?(search_string)
    end
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(search_string)
    find_by_title(search_string).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.done = false }
  end

  def check(index)
    raise IndexError if (index < 0 || index >= @todos.size)
  end

  def to_s
    @todos.each do |todo|
      puts todo
    end
  end
end

# TodoList Class	Description
# find_by_title	takes a string as argument, and returns the first Todo object that matches the argument. Return nil if no todo is found.
# all_done	returns new TodoList object containing only the done items
# all_not_done	returns new TodoList object containing only the not done items
# mark_done	takes a string as argument, and marks the first Todo object that matches the argument as done.
# mark_all_done	mark every todo as done
# mark_all_undone	mark every todo as not done

# TESTING
# given
todo1 = Todo.new('buy milk')
todo2 = Todo.new('clean room')
todo3 = Todo.new('go to the gym')
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

#add
list.add(todo1)
list.add(todo2)
list.add(todo3)
# list.add(1)
puts "--- find_by_title('milk') ---"
puts list.find_by_title('milk')
puts "--- mark_done('milk') ---"
puts list.mark_done('milk')
puts "--- all_done ---"
puts list.all_done
puts "--- mark_all_done ---"
puts list.mark_all_done
puts "--- all_done ---"
puts list.all_done
puts "--- mark_all_undone ---"
puts list.mark_all_undone
puts "--- all_not_done ---"
puts list.all_not_done

#
# results = list.select { |todo| todo.done? }    # you need to implement this method
#
# puts results.inspect
#
# list.each do |todo|
#   puts todo
# end

# <<
# same behaviour as add

# ---- Interrogating the list -----

#size
list.size     # returns 3

#first
list.first    # return todo1

#last
list.last     # return todo3

# ---- Retrieving an item in the list ----

# item_at
# list.item_at        # raises ArgumentError
list.item_at(1)     # returns 2nd item in the list (zero based index)
# list.item_at(100)   # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
# list.mark_done_at       # raises ArgumentError
list.mark_done_at(1)    # marks the 2nd item as done
# list.mark_done_at(100)  # raises IndexError

# ---- Deleting from the list -----

# shift
# list.shift              # removes and returns the first item in the list

# pop
# list.pop                # removes and returns the last item in the list

# remove_at
# list.remove_at          # raises ArgumentError
# list.remove_at(1)       # removes and returns the 2nd item
# list.remove_at (100)    # raises IndexError

# ---- Outputting the list -----

# to_s
# list.to_s               # returns string representation of the list
