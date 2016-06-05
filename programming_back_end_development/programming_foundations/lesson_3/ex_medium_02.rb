statement = "The Flintstones Rock"

counting_chars = {}

statement.each_char do |char|
  if counting_chars.keys.include?(char)
    counting_chars[char] += 1
  else 
    counting_chars[char] = 1
  end
end

p counting_chars
    
