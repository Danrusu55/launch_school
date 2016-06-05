def multiply(x, y)
  x.to_f * y.to_f
end

puts "Enter a number : " 
a = gets.chomp
puts "Enter a number : " 
b = gets.chomp

puts "#{a} times #{b} = #{multiply(a,b)}"
