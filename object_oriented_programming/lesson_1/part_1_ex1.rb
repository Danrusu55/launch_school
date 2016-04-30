# Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.
class MyCar
  attr_accessor :year, :color, :model, :current_speed

  def initialize(year, color, model, current_speed = 0)
    @year = year
    @color = color
    @model = model
    @current_speed = current_speed
  end
  def accelerate
    self.current_speed
  end
  def brake(speed_minus)
    self.current_speed -= speed_minus
  end
  def car_off
    puts "Car is off."
  end
  def car_on
    puts "Car is on."
  end
end
