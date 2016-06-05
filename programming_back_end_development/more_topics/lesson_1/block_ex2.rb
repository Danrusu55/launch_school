def compare(str)
  puts "Before: #{str}"
  yield(str) if block_given?
  puts "After: #{str}"
end
compare("alex") 
compare("alex-2") { |x| x.upcase! }
