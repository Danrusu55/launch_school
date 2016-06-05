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

  def not_done!
    self.done = false
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

  alias_method :<<, :add

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

  def mark_not_done_at(index)
    check(index)
    @todos[index].not_done!
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

  def select
    new_list = TodoList.new(title)
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
    str = "--- #{title} ---\n"
    str << @todos.map(&:to_s).join("\n")
    str
  end

  def to_a
    @todos
  end
end


