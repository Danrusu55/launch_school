class Anagram
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def match(str_arr)
    new_arr = []
    str_arr.each do |str|
      test_text = text.downcase

      str.each_char do |char|
        if test_text.include?(char.downcase)
          index = test_text.rindex(char.downcase)
          test_text.slice!(index)
        end
      end

      if str.length == text.length && test_text.empty? && str.downcase != text.downcase
        new_arr << str
      end
    end
    new_arr
  end
end
