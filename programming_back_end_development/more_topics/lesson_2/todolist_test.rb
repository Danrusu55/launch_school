require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'todo'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end
  
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal(2, @list.size)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal(2, @list.size)
  end

  def test_done?
    assert_equal(@todo1.done?, false)
  end

  def test_add
    assert_raises(TypeError) { @list.add(0) }
    assert_raises(TypeError) { @list.add('a') }
  end

  def test_add_alias
    test_todo = Todo.new("test")
    @list.add(test_todo)
    test_todo_list = @todos << test_todo
    assert_equal(test_todo_list, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(10) }
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(10) }
    @todo1.done = false
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done)
  end

  def test_mark_not_done_at
    assert_raises(IndexError) { @list.mark_not_done_at(10) }
    @todo1.done = true
    @list.mark_not_done_at(0)
    assert_equal(false, @todo1.done)
  end

  def test_done!
    @todo1.done = false
    @todo1.done!
    assert_equal(true, @todo1.done)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(10) }
    @list.remove_at(0)
    assert_equal(@todo2, @list.item_at(0))
  end

  def test_to_s 
 
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    --- Today's Todos ---
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    
    assert_equal(output, @list.to_s)
  end

  def test_2_to_s
    
    @todo1.done!

    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    --- Today's Todos ---
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    
    assert_equal(output, @list.to_s)
  end

  def test_each
    arr = []
    @list.each { |todo| arr << todo }
    assert_equal(arr, @todos)
  end

  def second_test_each
    output = @list.each {}
    assert_equal(output, @list)
  end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select { |todo| todo.done? }.to_s)
  end  
end
