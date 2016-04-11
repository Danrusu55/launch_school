# divide.rb

def divide(number, divisor)
  begin
    answer = number / divisor
  rescue ZeroDivisionError => e
    puts e.message
  end
end

first_number = gets.chomp.to_i
second_number = gets.chomp.to_i

puts divide(first_number, second_number)
