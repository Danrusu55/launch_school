# Remove vowels

def remove_vowels(str_arr)
  new_str_arr = str_arr.map do |str|
    str.gsub!(/[a,e,i,o,u]/, '')
  end
  puts new_str_arr
end

str_arr = ["green", "brown", "blue"]

remove_vowels(str_arr)

def check_balanced_parantheses(string)
  count_left_paran = 0
  count_right_paran = 0
  return false if string.match(/[)]\w/) || string.match(/[(]\w/)
  string.each_char do |chr|
    count_left_paran += 1 if chr == '('
    count_right_paran += 1 if chr == ')'
  end
  return true if count_right_paran == count_left_paran
  false
end

string_01 = "((a))"
string_02 = "(udkfslk())"
string_03 = "((sdfsdsfddfs())"
string_04 = "(')a(')"

puts check_balanced_parantheses(string_01)
puts check_balanced_parantheses(string_02)
puts check_balanced_parantheses(string_03)
puts check_balanced_parantheses(string_04)

def check_prime(number)
  return false if number <= 1
  (2..number).each do |num|
    if num != number && number % num == 0
      return false
    end
  end
  true
end

def find_primes(start_integer, end_integer)
  count = start_integer
  loop do
    break if count > end_integer
    puts count if check_prime(count)
    count += 1
  end
end

find_primes(1,20)
