# recursion_to_zero.rb

def to_zero(x)
  if x <= 0
    puts x
  else
    puts x
    to_zero(x-1)
  end
end

number = gets.chomp.to_i

to_zero(number)
