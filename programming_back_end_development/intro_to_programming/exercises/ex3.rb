# ex3.rb
# Use the each method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.

arr = [1,2,3,4,5,6,7,8,9,10]

arr2 = arr.select { |x| x.odd? }

puts arr2
  
