# ex13.rb

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts["Joe Smith"] = contact_data[0]
contacts["Sally Johnson"] = contact_data[0]

contacts.each do |k,v|
  v.each {|x| p "#{k} : #{x}" }
end

puts "ex13.rb\n"

p "Joe Smith : #{contacts["Joe Smith"][0]}"
p "Sally Johnson : #{contacts["Sally Johnson"][2]}"
