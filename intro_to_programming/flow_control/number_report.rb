puts "Enter a number between 0 and 100"

number = gets.chomp.to_i
  when (number >= 0 && number <= 50)
    "Number is between 0 and 50"
  when (number >= 51 && number <= 100)
    "Number is between 51 and 100"
  else
    puts "Number is not between 0 and 100"
end

puts answer
