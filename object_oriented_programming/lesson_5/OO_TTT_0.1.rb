# Object oriented Tic Tac Toe Game
require 'pry'

class Board
  attr_reader :squares
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+------"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+------"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end

  def []=(number, marker)
    @squares[number].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # return winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      return squares.first.marker if three_identical_markers?(squares)
    end
    nil
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " ".freeze

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :marker, :name, :score

  def initialize(marker, name='')
    @marker = marker
    @name = name
    @score = 0
  end
end

class TTTGame
  X_MARKER = "X".freeze
  O_MARKER = "O".freeze
  attr_accessor :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(X_MARKER)
    @computer = Player.new(O_MARKER)
    @current_player = @computer
  end

  def play
    chose_player_names
    clear_screen
    display_welcome_message
    loop do
      display_board
      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board if human_turn?
      end
      display_result
      break unless play_again?
      reset
    end
    goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!\n"
  end

  def chose_player_names
    print "Please enter your name : "
    name = gets.chomp
    human.name = name
    print "Please enter computer name : "
    name = gets.chomp
    computer.name = name
  end

  def goodbye_message
    puts "Thanks for playing Tic Tac Toe"
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def display_board
    puts ""
    puts "#{human.name} are #{human.marker}, #{computer.name} is #{computer.marker}.\n"
    board.draw
    puts ""
  end

  def human_turn?
    @current_player == @human
  end

  def current_player_moves
    if @current_player == @human
      human_move
      @current_player = @computer
    elsif @current_player == @computer
      computer_move
      @current_player = @human
    end
  end

  def human_move
    square = ''
    loop do
      print "Choose a square (#{board.unmarked_keys.join(', ')}) : "
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that is not a valid choice!"
    end
    board[square] = human.marker
  end

  def computer_AI
    return 5 if board.unmarked_keys.length == 9
    square = board.unmarked_keys.sample
    #computer offense
    Board::WINNING_LINES.each do |line|
      arr = []
      line.each do |index|
        if board.squares[index].marker == X_MARKER
          arr << index
          if arr.length == 2
            line.each do |x|
              if !arr.include?(x) && board.unmarked_keys.include?(x)
                return x
              end
            end
          end
        end
      end
    end
    #computer defense
    Board::WINNING_LINES.each do |line|
      arr = []
      line.each do |index|
        if board.squares[index].marker == O_MARKER
          arr << index
          if arr.length == 2
            line.each do |x|
              if !arr.include?(x) && board.unmarked_keys.include?(x)
                return x
              end
            end
          end
        end
      end
    end
    square
  end

  def computer_move
    square = computer_AI
    board[square] = computer.marker
  end

  def clear_screen
    system 'clear'
  end

  def play_again?
    answer = nil
    loop do
      print "Would you like to play again [y/n] : "
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n."
    end
    answer == 'y'
  end

  def reset
    @current_player = @computer
    board.reset
    clear_screen
    puts "Let's play again!"
  end
end

game = TTTGame.new
game.play
