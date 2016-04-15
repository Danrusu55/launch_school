# titleize!

def titleize!(string)
  string.split.map { |word| word.capitalize! }.join(' ')
end

string = "hello there!"
puts string
string = titleize!(string)
puts string
