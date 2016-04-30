# Override the to_s method to create a user friendly print out of your object.
class MyCar
  attr_accessor :year, :color, :model, :current_speed

  def initialize(year, color, model, current_speed = 0)
    @year = year
    @color = color
    @model = model
    @current_speed = current_speed
  end
  def accelerate(speed_pluse)
    self.current_speed += speed_pluse
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
