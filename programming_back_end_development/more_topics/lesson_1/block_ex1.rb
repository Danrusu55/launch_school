def incrementor(number, step)
  if block_given?
    yield(number)
  else
    number + step
  end
end

incrementor(10, 5) do |x, y|
  puts "first:#{x}, second:#{y}end"
end


