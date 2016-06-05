class Parent
  def say_hi
    p "Hi from parent."
  end
end

class Child < Parent
  def say_hi
    p "Hi from child."
  end

  def send
    p "Send from child..."
  end

  def instance_of?
    p "I am a fake instance"
  end
end

son = Child.new
puts son.instance_of? Child
puts son.instance_of? Parent
