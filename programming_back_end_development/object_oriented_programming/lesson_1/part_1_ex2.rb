# Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.
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
end
