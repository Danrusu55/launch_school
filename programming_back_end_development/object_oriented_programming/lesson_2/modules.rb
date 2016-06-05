module Swim
  def swim
    'swimming!'
  end
end

class Pet
  def run
    'running'
  end

  def jump
    'jumping'
  end
end

class Dog < Pet
  include Swim
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

puts "---Pet ancestors---"
puts Pet.ancestors
puts "---Dog ancestors---"
puts Dog.ancestors
