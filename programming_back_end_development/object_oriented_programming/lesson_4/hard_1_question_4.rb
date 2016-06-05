class Vehicle
  attr_accessor :speed, :heading
  def initialize(km_travelled_per_litre, litres_of_fuel_capacity)
    @fuel_efficiency = km_travelled_per_litre
    @fuel_capacity = litres_of_fuel_capacity
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end


class WheeledVehicle < Vehicle
  def initialize(tire_array, km_travelled_per_litre, litres_of_fuel_capacity)
    super(km_travelled_per_litre, litres_of_fuel_capacity)
    @tires = tire_array
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures along with
    super([20,20], 80, 8.0)
  end
end

class Catamaran < Vehicle
  attr_accessor :propellor, :hull_count

  def initialize(num_propellors, num_hulls, km_travelled_per_litre, litres_of_fuel_capacity)
    @num_propellors = num_propellors
    @num_hulls = num_hulls
    super(km_travelled_per_litre, litres_of_fuel_capacity)
  end

  def range
    (@fuel_capacity * @fuel_efficiency) + 10
  end
end

class Motorboat < Catamaran
  def initialize(km_travelled_per_litre, litres_of_fuel_capacity)
    super(1,1, km_travelled_per_litre, litres_of_fuel_capacity)
  end
end

motorbike = Motorcycle.new
car = Auto.new
boat = Catamaran.new(2,2,60,30.0)
mboat = Motorboat.new(50, 12.0)

p motorbike
p car
p boat
p mboat

puts motorbike.range
puts car.range
puts boat.range
puts mboat.range
