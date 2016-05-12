num_arr = []
f = File.readlines('num.txt')
index = 0
while index < f.size
  f[index].strip!
  f[index].each_char { |char| num_arr << char }
  index += 1
end

index = 0
product = 0
loop do
  test_product = 1
  0.upto(12) { |x| test_product *= num_arr[index + x].to_i }
  product = test_product if test_product > product
  index += 1
  break if index > 988
end

puts product
