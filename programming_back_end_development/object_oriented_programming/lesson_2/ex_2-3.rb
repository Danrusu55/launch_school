class Person
  attr_reader :name, :first_name, :last_name

  def initialize(name)
    @first_name = name.split(' ').first
    @last_name = name.split(' ')[1]
    get_name
  end

  def first_name=(first_name)
    @first_name = first_name
    get_name
  end

  def last_name=(last_name)
    @last_name = last_name
    get_name
  end

  private

  def get_name
    @name = "#{self.first_name} #{self.last_name}"
  end
end

bob = Person.new('Robert')
puts bob.name
puts bob.first_name
puts bob.last_name
bob.last_name = 'Smith'
puts bob.name
