def greeting(name)
  puts "Hi there #{name}"
end

puts "Enter your name."
get_name = gets.chomp

greeting(get_name)
