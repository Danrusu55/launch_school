# Question 4

require 'pry'

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number

  numbers.shift(1)
end

