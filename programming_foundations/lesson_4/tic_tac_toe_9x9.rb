# tic_tac_toe.rb
require 'pry'

def computers_turn_random
  computers_col = rand(1..9)
  case computers_col
  when 1
    computers_col = 'a'
  when 2
    computers_col = 'b'
  when 3
    computers_col = 'c'
  when 4
    computers_col = 'd'
  when 5
    computers_col = 'e'
  when 6
    computers_col = 'f'
  when 7
    computers_col = 'g'
  when 8
    computers_col = 'h'
  when 9
    computers_col = 'i'
  end
  computers_row = rand(1..9)
  move = [computers_col, computers_row]
end

board_hash = { 'a' => { 1=> ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }, 
                          'b' => { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }, 
                          'c' => { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }, 
                          'd' => { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }, 
                          'e' => { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }, 
                          'f' => {1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }, 
                          'g' => { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }, 
                          'h' => { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }, 
                          'i' => { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' } }

def build_board(board_hash)
  puts "\n"
  puts "   a   b   c   d   e   f   g   h   i"
  puts " 1 #{board_hash['a'][1]} | #{board_hash['b'][1]} | #{board_hash['c'][1]} | #{board_hash['d'][1]} | #{board_hash['e'][1]} | #{board_hash['f'][1]} | #{board_hash['g'][1]} | #{board_hash['h'][1]} | #{board_hash['i'][1]} "
  puts " ------------------------------------"
  puts " 2 #{board_hash['a'][2]} | #{board_hash['b'][2]} | #{board_hash['c'][2]} | #{board_hash['d'][2]} | #{board_hash['e'][2]} | #{board_hash['f'][2]} | #{board_hash['g'][2]} | #{board_hash['h'][2]} | #{board_hash['i'][2]} "
  puts " ------------------------------------"
  puts " 3 #{board_hash['a'][3]} | #{board_hash['b'][3]} | #{board_hash['c'][3]} | #{board_hash['d'][3]} | #{board_hash['e'][3]} | #{board_hash['f'][3]} | #{board_hash['g'][3]} | #{board_hash['h'][3]} | #{board_hash['i'][3]} "
  puts " ------------------------------------"
  puts " 4 #{board_hash['a'][4]} | #{board_hash['b'][4]} | #{board_hash['c'][4]} | #{board_hash['d'][4]} | #{board_hash['e'][4]} | #{board_hash['f'][4]} | #{board_hash['g'][4]} | #{board_hash['h'][4]} | #{board_hash['i'][4]} "
  puts " ------------------------------------"
  puts " 5 #{board_hash['a'][5]} | #{board_hash['b'][5]} | #{board_hash['c'][5]} | #{board_hash['d'][5]} | #{board_hash['e'][5]} | #{board_hash['f'][5]} | #{board_hash['g'][5]} | #{board_hash['h'][5]} | #{board_hash['i'][5]} "
  puts " ------------------------------------"
  puts " 6 #{board_hash['a'][6]} | #{board_hash['b'][6]} | #{board_hash['c'][6]} | #{board_hash['d'][6]} | #{board_hash['e'][6]} | #{board_hash['f'][6]} | #{board_hash['g'][6]} | #{board_hash['h'][6]} | #{board_hash['i'][6]} "
  puts " ------------------------------------"
  puts " 7 #{board_hash['a'][7]} | #{board_hash['b'][7]} | #{board_hash['c'][7]} | #{board_hash['d'][7]} | #{board_hash['e'][7]} | #{board_hash['f'][7]} | #{board_hash['g'][7]} | #{board_hash['h'][7]} | #{board_hash['i'][7]} "
  puts " ------------------------------------"
  puts " 8 #{board_hash['a'][8]} | #{board_hash['b'][8]} | #{board_hash['c'][8]} | #{board_hash['d'][8]} | #{board_hash['e'][8]} | #{board_hash['f'][8]} | #{board_hash['g'][8]} | #{board_hash['h'][8]} | #{board_hash['i'][8]} "
  puts " ------------------------------------"
  puts " 9 #{board_hash['a'][9]} | #{board_hash['b'][9]} | #{board_hash['c'][9]} | #{board_hash['d'][9]} | #{board_hash['e'][9]} | #{board_hash['f'][9]} | #{board_hash['g'][9]} | #{board_hash['h'][9]} | #{board_hash['i'][9]} "
  puts " ------------------------------------"
  puts "\n"
end

def build_score_board(score_01, score_02)
  puts "\n"
  puts " Human  |  Computer"
  puts "--------------------"
  puts "   #{score_01}    |    #{score_02}"
  puts "\n"
end



def check_winner(board_hash, player)
  # Check column for winner
  board_hash.each do |cols, rows|
    col_occupied = 0
    1.upto(9) do |row| 
      if board_hash[cols][row] == player
        col_occupied += 1
      end
    end
    return true if col_occupied == 9
  end
  # Check row for winner
  row_01_occupied = 0
  row_02_occupied = 0
  row_03_occupied = 0
  row_04_occupied = 0
  row_05_occupied = 0
  row_06_occupied = 0
  row_07_occupied = 0
  row_08_occupied = 0
  row_09_occupied = 0
  board_hash.each do |cols, _|
    puts "Checked #{cols} column for #{player}"
    if board_hash[cols][1] == player then row_01_occupied += 1
    elsif board_hash[cols][2] == player then row_02_occupied += 1
    elsif board_hash[cols][3] == player then row_03_occupied += 1
    elsif board_hash[cols][4] == player then row_04_occupied += 1
    elsif board_hash[cols][5] == player then row_05_occupied += 1
    elsif board_hash[cols][6] == player then row_06_occupied += 1
    elsif board_hash[cols][7] == player then row_07_occupied += 1
    elsif board_hash[cols][8] == player then row_08_occupied += 1
    elsif board_hash[cols][9] == player then row_09_occupied += 1
    end
  end
  puts "Row 1 has #{row_01_occupied} occupied columns"
  return true if row_01_occupied == 9
  return true if row_02_occupied == 9
  return true if row_03_occupied == 9
  return true if row_04_occupied == 9
  return true if row_05_occupied == 9
  return true if row_06_occupied == 9
  return true if row_07_occupied == 9
  return true if row_08_occupied == 9
  return true if row_09_occupied == 9
  false
end

# check that the col_row is a key
# check that the selected key is not occupied
# if meets both conditions return true, otherwise return false
def check_input_valid(col_move, row_move, board_hash)
  board_hash.each do |cols, rows|
    rows.each do |row, value|
      return true if col_move == cols && row_move == row && board_hash[col_move][row_move] == ' '
    end
  end
  false
end

def check_draw(board_hash)
  board_hash.each do |cols, _|
    1.upto(9) do |row|
      return false if board_hash[cols][row] == ' '
    end
  end
  true
end

# def computers_turn(board_hash)
#   #inspect board
#   if board_hash[:b2] == ' '
#     puts "computer takes the middle"
#     return 'b2'
#   end
#   computer_move = computers_intelligent_move(board_hash)
#   puts "computer intelligent move: #{computer_move}"
#   if computer_move != ' '
#     return computer_move
#   end
#   computers_turn_random
# end

human_score = 0
computer_score = 0

# LOOP here
loop do
  # Build empty board
board_hash = { 'a' => { 1=> ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }, 
                          'b' => { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }, 
                          'c' => { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }, 
                          'd' => { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }, 
                          'e' => { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }, 
                          'f' => {1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }, 
                          'g' => { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }, 
                          'h' => { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }, 
                          'i' => { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' } } 
  col = ' '
  row = 0
  computer_move = []
  # LOOP here
  loop do
    # output board to screen
    build_board(board_hash)
    build_score_board(human_score, computer_score)

    # Human has turn
    puts "Human please take a turn."
    loop do
      puts "Please chose column ( from a to i )."
      col = gets.chomp
      puts "Please chose row ( from 1 to 9 )."
      row = gets.chomp.to_i

      # Check input is valid
      break if check_input_valid(col, row, board_hash)
      puts "Please make a valid choice: "
    end

    # Add to board
    board_hash[col][row] = 'x'
    # pry.bind

    # Check for winner
    # If winner break
    if check_winner(board_hash, 'x')
      build_board(board_hash)
      puts "You won!!"
      human_score += 1
      break
    end

    # Check for draw
    if check_draw(board_hash)
      build_board(board_hash)
      puts "It is a draw . . ."
      break
    end

    # Computer has turn
    puts "Computer's turn . . ."
    loop do
      computer_move = computers_turn_random
      break if check_input_valid(computer_move[0], computer_move[1], board_hash)
    end

    # Put player two on the board
    board_hash[computer_move[0]][computer_move[1]] = 'o'

    # Check for winner
    # If winner break
    if check_winner(board_hash, 'o')
      build_board(board_hash)
      puts "computer won!!"
      computer_score += 1
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
