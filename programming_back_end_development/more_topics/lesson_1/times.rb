def times(number)
  count = 0
  while count < number
    yield(count)
    count += 1
  end
  number
end

times(5) do |num|
  puts num
end
