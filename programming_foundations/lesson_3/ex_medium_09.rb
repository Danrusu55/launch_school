munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_value do |value|
  value["age_group"] = "senior" if (value["age"] > 100)
  value["age_group"] = "adult" if (value["age"] <= 100 && value["age"] > 17)
  value["age_group"] = "child" if (value["age"] < 18)
end

puts munsters

age_of_males = 0
munsters.each_value do |value|
  age_of_males = age_of_males + value["age"] if value["gender"] == "male"
end
puts "Age of all the males == #{age_of_males}"
