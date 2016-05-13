class WordProblem
  attr_reader :text, :operators, :numbers

  def initialize(text)
    @text = text.split(' ')
    @operators = []
    @numbers = []
  end

  def answer
    get_numbers_and_operators
    left_number = numbers.shift
    loop do
      break if numbers.empty?
      left_number = self.send operators.shift, left_number, numbers.shift
    end
    left_number
  end

  def plus(*args)
    args[0] + args[1]
  end

  def minus(*args)
    args[0] - args[1]
  end

  def multiplied(*args)
    args[0] * args[1]
  end

  def divided(*args)
    args[0] / args[1]
  end

  def get_numbers_and_operators
    raise ArgumentError unless text.last.include?('?') && text.first.match('What') && text[1].match('is')
    index = 2 # step over 'What is'
    loop do
      # Check if the number ends with ?
      if text[index].include?('?')
        text[index].gsub!('?', '')
        numbers.push(text[index].to_i)
        break
      end
      numbers.push(text[index].to_i)

      index += 1  # increment index to operator
      operators.push(text[index])

      if text[index].match('plus') || text[index].match('minus')
        index += 1 # increment index to next number
      elsif text[index].match('multiplied') || text[index].match('divided')
        index += 2 # increment index to next number
      else
        raise ArgumentError
      end
    end
  end
end
