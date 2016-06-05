numbers = [1,2,3,4,5,6,7,8,9]

numbers.chunk { |n|
  n.even?
}.each { |even, ary|
  p [even, ary]
}
