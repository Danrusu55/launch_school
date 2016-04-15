def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.length > 4 || dot_separated_words.length < 4
    return false
  else
    dot_separated_words.each do |elem|
      puts elem
      return false unless elem.match(/[0-9]+/)
    end
    return true
  end
end

puts "Should be true: #{dot_separated_ip_address?("192.168.0.0")}"
puts "Should be false: #{dot_separated_ip_address?("192.168.0")}"
puts "Should be false: #{dot_separated_ip_address?("192.sfd.0.0")}"
puts "Should be false: #{dot_separated_ip_address?("df.df.df.df")}"
puts "Should be false: #{dot_separated_ip_address?("34.34.34.34.34")}"
puts "Should be true: #{dot_separated_ip_address?("0.1.2.3")}"
