def factors(number)
  dividend = number
  divisors = []
  while dividend > 0         
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

number = gets.chomp.to_i

puts factors(number)
