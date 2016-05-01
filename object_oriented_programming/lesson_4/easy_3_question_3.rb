class AngryCat
  def initialize(age, name)
    @age = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssssssss!!!"
  end
end

cat1 = AngryCat.new(8, "Tabby")
cat2 = AngryCat.new(6, "Cat")

cat1.name
cat1.age
cat1.hiss

cat2.name
cat2.age
cat2.hiss
