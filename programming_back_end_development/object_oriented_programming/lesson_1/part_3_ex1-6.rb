# Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.
#
# Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way.
# Override the to_s method to create a user friendly print out of your object.
module Cargo
  def hauling(product)
    puts "I am hauling #{product}"
  end
end

class Vehicles
  attr_accessor :model, :year, :current_speed
  VEHICLE_TYPE = 'vehicle'
  @@number_of_vehicles = 0

  def initialize(model, year, current_speed = 0)
    @model = model
    @year = year
    @current_speed = current_speed
    @@number_of_vehicles += 1
  end
  def vehicles_created
    @@number_of_vehicles
  end
  def accelerate(speed_pluse)
    self.current_speed += speed_pluse
  end
  def brake(speed_minus)
    self.current_speed -= speed_minus
  end
  def self.to_s
    "Your vehicle is a #{VEHICLE_TYPE} model #{@model}, built in the year  #{@year}."
  end
end

class MyTruck < Vehicles
  include Cargo

  VEHICLE_TYPE = 'truck'

  attr_accessor :size

  def initialize(size, model, year, current_speed = 0)
    @size = size
    super(model, year, current_speed = 0)
  end

end

class MyCar < Vehicles

  VEHICLE_TYPE = 'car'

  attr_accessor :color

  def initialize(color, model, year, current_speed = 0)
    @color = color
    super(model, year, current_speed = 0)
  end
  def age
    get_age_of_car
  end
  def car_off
    puts "Car is off."
  end
  def car_on
    puts "Car is on."
  end
  def view_year
    puts "Your car was built in #{self.year}"
  end
  def view_color
    puts "Your car is the color #{self.color}"
  end
  def spray_paint_car(new_color)
    puts "Spray painting your car #{new_color} . . ."
    self.color = new_color
    puts sleep(3)
    puts "Your car is now #{self.color}"
  end
  def km_per_litre(km, litres)
    puts "Your car travels #{km/litres} kilometres for every litre of petrol."
  end
  private
  def get_age_of_car
    t = Time.new
    age = t.year - self.year.to_i
    puts "Your car is #{age} years old."
  end
end

puts Vehicles.ancestors
puts MyTruck.ancestors
puts MyCar.ancestors

my_car = MyCar.new('red', 'ford', 2010)
my_car.to_s
my_car.view_color
my_car.view_year
my_car.age
