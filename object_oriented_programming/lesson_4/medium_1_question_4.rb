class Greeting

  def greet(greeting)
    puts greeting
  end
end

class Hello < Greeting

  def hi
    greet("Hello")
  end
end

class Bye < Greeting

  def bye
    greet("Goodbye")
  end
end

hello = Hello.new
hello.hi

goodbye = Bye.new
goodbye.bye
