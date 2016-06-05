class Pet

  def swim
    'swimming!'
  end

  def run
    'running'
  end

  def jump
    'jumping'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def fetch
    'fetching'
  end
end

class Bulldog < Dog
  def swim
    "can't swim"
  end
end

class Cat < Pet
  def swim
    "can't swim"
  end

  def fetch
    "will not fetch"
  end

  def speak
    'meow'
  end
end

class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def to_s
    "#{name} has the following pets: "
    self.pets.each do |pet|
      "#{pet.class} "
    end
end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

puts bob.pets

bob.pets.each do |pet|
  puts pet.jump
end
