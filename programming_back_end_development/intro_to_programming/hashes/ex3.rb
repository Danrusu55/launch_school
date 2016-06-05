
person = {name:'Jessie',age:29,hair:'blonde',height:'little'}

person.keys.each{|x| puts x}
person.values.each{|x| puts x}
person.each do |k,v| 
  puts "#{k}: #{v}"
end

