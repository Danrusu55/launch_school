# Add a class method to your MyCar class that calculates the gas mileage of any car.
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
end
