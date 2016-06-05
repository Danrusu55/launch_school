def each(arr)
  count = 0
  length = arr.length
  while count < arr.length
    yield(arr[count])
    count += 1
  end
  arr
end

each([1,2,3]) { |elem| puts elem }
