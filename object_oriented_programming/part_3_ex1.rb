# Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.
#
# Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way.
# Override the to_s method to create a user friendly print out of your object.
class Vehicles
  attr_accessor :current_speed

  def initialize(current_speed = 0)
    @color = color
    @current_speed = current_speed
  end

  def accelerate(speed_pluse)
    self.current_speed += speed_pluse
  end
  def brake(speed_minus)
    self.current_speed -= speed_minus
  end
end

class MyTruck

  @@VEHICLE_TYPE = 'Truck'

  attr_accessor :year, :model

  def initialize
    super(current_speed)
    @year = year
    @model = model
    @color = color
  end

  def to_s
    "Your vehicle is a #{@@VEHICLE_TYPE} model #{self.model}, built in the year  #{self.year} and the color #{self.color}."
  end

end

class MyCar < Vehicles

  @@VEHICLE_TYPE_CAR = 'Car'

  attr_accessor :year, :model

  def initialize(year, model)
    super(current_speed)
    @year = year
    @model = model
    @color = color
  end

  def car_off
    puts "Car is off."
  end
  def car_on
    puts "Car is on."
  end
  def view_year
    puts "Your car is #{self.year}"
  end
  def view_color
    puts "Your car is #{self.color}"
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
  def to_s
    puts "Your car is a #{self.year} #{self.model} that is the color #{self.color}, its current speed is #{self.current_speed}km/h"
  end
end
