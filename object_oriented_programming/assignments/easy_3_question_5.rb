class Television
  def self.manufacturer
    puts "manufacturer class method"
  end

  def model
    puts "model instance method"
  end
end

tv = Television.new
tv.manufacturer # -> NoMethodError
tv.model # "model instance method"

Television.manufacturer # "manufacturer class method"
Television.model # -> NoMethodError
