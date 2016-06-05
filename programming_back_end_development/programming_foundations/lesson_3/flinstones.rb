# flintstones exercise

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}

flintstones.each_with_index do |v, i|
  flintstones_hash[v] = i
end

puts flintstones_hash

