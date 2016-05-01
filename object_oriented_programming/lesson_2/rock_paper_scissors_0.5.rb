class Rock
  def win?(other_move)
    return true if other_move.class == Scissors
    false
  end

  def to_s
    'rock'
  end
end

class Paper
  def win?(other_move)
    return true if other_move.class == Rock
    false
  end

  def to_s
    'paper'
  end
end

class Scissors
  def win?(other_move)
    return true if other_move.class == Paper
    false
  end

  def to_s
    'scissors'
  end
end

class Player
  attr_accessor :move, :name, :score
  def initialize
    set_name
    @score = 0
  end
end

class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors'].freeze

  def initialize(choice)
    case choice
    when 'rock'
      value = Rock.new
    when 'paper'
      value = Paper.new
    when 'scissors'
      value = Scissors.new
    end
    @value = value
  end

  def to_s
    @value
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What is your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value"
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalide choice"
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'DarthVader', 'Luke Skywalker', 'Han Solo'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Hi there #{human.name}. Welcome to Rock, Paper, Scissors."
  end

  def display_goodbye_messgae
    puts "Thanks for playing #{human.name}, goodbye."
  end

  def display_choice
    puts "#{human.name} chose #{human.move.value}."
    puts "#{computer.name} chose #{computer.move.value}."
  end

  def display_winner
    if human.move.value.win?(computer.move.value)
      human.score += 1
      puts "#{human.name} won!"
    elsif computer.move.value.win?(computer.move.value)
      computer.score += 1
      puts "#{computer.name} won!"
    else
      puts "It is a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? [y/n]"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry answer must be y or n."
    end

    return true if answer == 'y'
    false
  end

  def check_winner?
    puts "The score is: #{human.name} -> #{human.score}, #{computer.name} -> #{computer.score}."
    true if human.score >= 10 || computer.score >= 10
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_choice
      display_winner
      break if check_winner?
      break unless play_again?
    end
    display_goodbye_messgae
  end
end

RPSGame.new.play
