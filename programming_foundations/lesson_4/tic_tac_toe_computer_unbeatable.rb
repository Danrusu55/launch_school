# tic_tac_toe.rb
require 'pry'

board_hash = { a1: ' ', a2: ' ', a3: ' ', b1: ' ', b2: ' ', b3: ' ', c1: ' ', c2: ' ', c3: ' ' }

def build_board(board_hash)
  puts "\n"
  puts "   a   b   c "
  puts " 1 #{board_hash[:a1]} | #{board_hash[:b1]} | #{board_hash[:c1]} "
  puts " ------------"
  puts " 2 #{board_hash[:a2]} | #{board_hash[:b2]} | #{board_hash[:c2]} "
  puts " ------------"
  puts " 3 #{board_hash[:a3]} | #{board_hash[:b3]} | #{board_hash[:c3]} "
  puts "\n"
end

# check that the col_row is a key
# check that the selected key is not occupied
# if meets both conditions return true, otherwise return false
def check_input_valid(col_row, board_hash)
  board_hash.each do |k, _|
    if col_row.to_sym == k && board_hash[col_row.to_sym] == ' '
      return true
    end
  end
  false
end

def check_winner(board_hash, player)
  (board_hash[:a1] == player && board_hash[:a2] == player && board_hash[:a3] == player) ||
    (board_hash[:b1] == player && board_hash[:b2] == player && board_hash[:b3] == player) ||
    (board_hash[:c1] == player && board_hash[:c2] == player && board_hash[:c3] == player) ||
    (board_hash[:a1] == player && board_hash[:b1] == player && board_hash[:c1] == player) ||
    (board_hash[:a2] == player && board_hash[:b2] == player && board_hash[:c2] == player) ||
    (board_hash[:a3] == player && board_hash[:b3] == player && board_hash[:c3] == player) ||
    (board_hash[:a1] == player && board_hash[:b2] == player && board_hash[:c3] == player) ||
    (board_hash[:a3] == player && board_hash[:b2] == player && board_hash[:c1] == player)
end

def check_draw(board_hash)
  board_hash.each do |_, v|
    return false if v == ' '
  end
  true
end

def computers_turn_random
  computers_choice = rand(1..9)
  case computers_choice
  when 1
    return 'a1'
  when 2
    return 'a2'
  when 3
    return 'a3'
  when 4
    return 'b1'
  when 5
    return 'b2'
  when 6
    return 'b3'
  when 7
    return 'c1'
  when 8
    return 'c2'
  when 9
    return 'c3'
  end
end

def computers_intelligent_move(board_hash)
  # Computer OFFENSE
  if board_hash[:a1] == 'o' && board_hash[:a2] == 'o' && board_hash[:a3] == ' '
    return 'a3'
  elsif board_hash[:b1] == 'o' && board_hash[:b2] == 'o' && board_hash[:b3] == ' '
    return 'b3'
  elsif board_hash[:c1] == 'o' && board_hash[:c2] == 'o' && board_hash[:c3] == ' '
    return 'c3'
  elsif board_hash[:a1] == 'o' && board_hash[:a2] == ' ' && board_hash[:a3] == 'o'
    return 'a2'
  elsif board_hash[:b1] == 'o' && board_hash[:b2] == ' ' && board_hash[:b3] == 'o'
    return 'b2'
  elsif board_hash[:c1] == 'o' && board_hash[:c2] == ' ' && board_hash[:c3] == 'o'
    return 'c2'
    elsif board_hash[:a1] == ' ' && board_hash[:a2] == 'o' && board_hash[:a3] == 'o'
    return 'a1'
  elsif board_hash[:b1] == ' ' && board_hash[:b2] == 'o' && board_hash[:b3] == 'o'
    return 'b1'
  elsif board_hash[:c1] == ' ' && board_hash[:c2] == 'o' && board_hash[:c3] == 'o'
    return 'c1' #check rows
  elsif board_hash[:a1] == 'o' && board_hash[:b1] == 'o' && board_hash[:c1] == ' '
    return 'c1'
  elsif board_hash[:a2] == 'o' && board_hash[:b2] == 'o' && board_hash[:c2] == ' '
    return 'c2'
  elsif board_hash[:a3] == 'o' && board_hash[:b3] == 'o' && board_hash[:c3] == ' '
    return 'c3'
  elsif board_hash[:a1] == 'o' && board_hash[:b1] == ' ' && board_hash[:c1] == 'o'
    return 'b1'
  elsif board_hash[:a2] == 'o' && board_hash[:b2] == ' ' && board_hash[:c2] == 'o'
    return 'b2'
  elsif board_hash[:a3] == 'o' && board_hash[:b3] == ' ' && board_hash[:c3] == 'o'
    return 'b3'
  elsif board_hash[:a1] == ' ' && board_hash[:b1] == 'o' && board_hash[:c1] == 'o'
    return 'a1'
  elsif board_hash[:a2] == ' ' && board_hash[:b2] == 'o' && board_hash[:c2] == 'o'
    return 'a2'
  elsif board_hash[:a3] == ' ' && board_hash[:b3] == 'o' && board_hash[:c3] == 'o'
    return 'a3'   # check diagonals
  elsif board_hash[:a1] == 'o' && board_hash[:b2] == 'o' && board_hash[:c3] == ' '
    return 'c3'
  elsif board_hash[:a1] == 'o' && board_hash[:b2] == ' ' && board_hash[:c3] == 'o'
    return 'b2'
  elsif board_hash[:a1] == ' ' && board_hash[:b2] == 'o' && board_hash[:c3] == 'o'
    return 'a1'
  elsif board_hash[:a3] == 'o' && board_hash[:b2] == 'o' && board_hash[:c1] == ' '
    return 'c1'
  elsif board_hash[:a3] == 'o' && board_hash[:b2] == ' ' && board_hash[:c1] == 'o'
    return 'b2'
  elsif board_hash[:a3] == ' ' && board_hash[:b2] == 'o' && board_hash[:c1] == 'o'
    return 'a3'
  end
  # Computer DEFENSE
  if board_hash[:a1] == 'x' && board_hash[:a2] == 'x' && board_hash[:a3] == ' '
    return 'a3'
  elsif board_hash[:b1] == 'x' && board_hash[:b2] == 'x' && board_hash[:b3] == ' '
    return 'b3'
  elsif board_hash[:c1] == 'x' && board_hash[:c2] == 'x' && board_hash[:c3] == ' '
    return 'c3'
  elsif board_hash[:a1] == 'x' && board_hash[:a2] == ' ' && board_hash[:a3] == 'x'
    return 'a2'
  elsif board_hash[:b1] == 'x' && board_hash[:b2] == ' ' && board_hash[:b3] == 'x'
    return 'b2'
  elsif board_hash[:c1] == 'x' && board_hash[:c2] == ' ' && board_hash[:c3] == 'x'
    return 'c2'
    elsif board_hash[:a1] == ' ' && board_hash[:a2] == 'x' && board_hash[:a3] == 'x'
    return 'a1'
  elsif board_hash[:b1] == ' ' && board_hash[:b2] == 'x' && board_hash[:b3] == 'x'
    return 'b1'
  elsif board_hash[:c1] == ' ' && board_hash[:c2] == 'x' && board_hash[:c3] == 'x'
    return 'c1' #check rows
  elsif board_hash[:a1] == 'x' && board_hash[:b1] == 'x' && board_hash[:c1] == ' '
    return 'c1'
  elsif board_hash[:a2] == 'x' && board_hash[:b2] == 'x' && board_hash[:c2] == ' '
    return 'c2'
  elsif board_hash[:a3] == 'x' && board_hash[:b3] == 'x' && board_hash[:c3] == ' '
    return 'c3'
  elsif board_hash[:a1] == 'x' && board_hash[:b1] == ' ' && board_hash[:c1] == 'x'
    return 'b1'
  elsif board_hash[:a2] == 'x' && board_hash[:b2] == ' ' && board_hash[:c2] == 'x'
    return 'b2'
  elsif board_hash[:a3] == 'x' && board_hash[:b3] == ' ' && board_hash[:c3] == 'x'
    return 'b3'
  elsif board_hash[:a1] == ' ' && board_hash[:b1] == 'x' && board_hash[:c1] == 'x'
    return 'a1'
  elsif board_hash[:a2] == ' ' && board_hash[:b2] == 'x' && board_hash[:c2] == 'x'
    return 'a2'
  elsif board_hash[:a3] == ' ' && board_hash[:b3] == 'x' && board_hash[:c3] == 'x'
    return 'a3'   # check diagonals
  elsif board_hash[:a1] == 'x' && board_hash[:b2] == 'x' && board_hash[:c3] == ' '
    return 'c3'
  elsif board_hash[:a1] == 'x' && board_hash[:b2] == ' ' && board_hash[:c3] == 'x'
    return 'b2'
  elsif board_hash[:a1] == ' ' && board_hash[:b2] == 'x' && board_hash[:c3] == 'x'
    return 'a1'
  elsif board_hash[:a3] == 'x' && board_hash[:b2] == 'x' && board_hash[:c1] == ' '
    return 'c1'
  elsif board_hash[:a3] == 'x' && board_hash[:b2] == ' ' && board_hash[:c1] == 'x'
    return 'b2'
  elsif board_hash[:a3] == ' ' && board_hash[:b2] == 'x' && board_hash[:c1] == 'x'
    return 'a3'
  else
    return ' '
  end
end

def computers_turn(board_hash)
  #inspect board
  if board_hash[:b2] == ' '
    puts "computer takes the middle"
    return 'b2'
  end
  computer_move = computers_intelligent_move(board_hash)
  puts "computer intelligent move: #{computer_move}"
  if computer_move != ' '
    return computer_move
  end
  computers_turn_random
end

# LOOP here
loop do
  # Build empty board
  board_hash = { a1: ' ', a2: ' ', a3: ' ', b1: ' ', b2: ' ', b3: ' ', c1: ' ', c2: ' ', c3: ' ' }
  col_row = ' '

  # LOOP here
  loop do
    # output board to screen
    build_board(board_hash)

    # Player two has turn
    puts "Computer's turn . . ."
    loop do
      col_row = computers_turn(board_hash)
      break if check_input_valid(col_row, board_hash)
    end

    # Put player two on the board
    board_hash[col_row.to_sym] = 'o'

    # Check for winner
    # If winner break
    if check_winner(board_hash, 'o')
      build_board(board_hash)
      puts "computer won!!"
      break

    end
    # Check for draw
    if check_draw(board_hash)
      build_board(board_hash)
      puts "It is a draw . . ."
      break
    end

    build_board(board_hash)

    # Human has turn
    puts "Human please take a turn."
    puts "Please chose column & row (from a1 to c3)."
    loop do
      col_row = gets.chomp

      # Check input is valid
      break if check_input_valid(col_row, board_hash)
      puts "Please make a valid choice: "
    end

    # Add to board
    board_hash[col_row.to_sym] = 'x'
    # pry.bind

    # Check for winner
    # If winner break
    if check_winner(board_hash, 'x')
      build_board(board_hash)
      puts "You won!!"
      break
    end
  end
  # END LOOP here

  # Check if player wants another game
  # If not break
  puts "Would you like another game (y - yes)?"
  play_again = gets.chomp
  break if play_again[0].downcase != 'y'
end
# END LOOP here
