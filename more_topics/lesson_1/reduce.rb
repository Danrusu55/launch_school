def reduce(arr, start=0)
  count = 0
  length = arr.length
  while count < length
    start = yield(start, arr[count])
    count += 1
  end
  start
end

array = [1,2,3,4,5]
x = reduce(array) { |acc, num| acc + num }
puts x
y = reduce(array, 10) { |acc, num| acc + num }
puts y
z = reduce(array) { |acc, num| acc + num if num.odd? }

