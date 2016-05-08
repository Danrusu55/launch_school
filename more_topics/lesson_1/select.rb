def select(arr)
  count = 0
  length = arr.length
  new_arr = []
  while count < length
    elem = arr[count]
    if yield(elem)
      new_arr << elem
    end
    count += 1
  end
  new_arr
end
array = [1,2,3,4,5] 
new_array = select(array) { |num| num.odd? }
puts new_array.to_s
select(array) { |num| puts num }
new_array = select(array) { |num| num + 1 }
puts new_array.to_s
