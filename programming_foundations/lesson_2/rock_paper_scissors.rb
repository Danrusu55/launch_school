VALID_CHOICES = %w(rock paper scissors lizard Spock)

def prompt(message)
  puts "=> #{message}"
end

def win?(player1, player2)
  (player1.start_with?('r') && player2.start_with?('s')) ||
    (player1.start_with?('p') && player2.start_with?('r')) ||
    (player1.start_with?('s') && player2.start_with?('p')) ||
    (player1.start_with?('r') && player2.start_with?('l')) ||
    (player1.start_with?('l') && player2.start_with?('S')) ||
    (player1.start_with?('S') && player2.start_with?('s')) ||
    (player1.start_with?('s') && player2.start_with?('l')) ||
    (player1.start_with?('l') && player2.start_with?('p')) ||
    (player1.start_with?('p') && player2.start_with?('S')) ||
    (player1.start_with?('S') && player2.start_with?('r'))
  end

def get_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def get_fullchoice(choice)
  return 'rock' if choice == 'r'
  return 'paper' if choice == 'p'
  return 'scissors' if choice == 's'
  return 'lizard' if choice == 'l'
  return 'Spock' if choice == 'S'
  choice
end

def print_score(player1_score, player2_score)
  prompt("Your score is #{player1_score}")
  prompt("Computer score is #{player2_score}")
end

def add_to_score(winner)
  winner += 1
end

player1_score = 0
player2_score = 0
loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES[0].include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{get_fullchoice(choice)}, computer chose: #{computer_choice}")

  get_result(choice, computer_choice)

 if win?(choice, computer_choice)
    player1_score = player1_score + 1
  elsif win?(computer_choice, choice)
    player2_score = player2_score + 1
end

  print_score(player1_score, player2_score)

  if player1_score >= 5
    prompt("You WON the best of five!!")
    break
  elsif player2_score >= 5
    prompt("Computer WON the best of five!!")
    break
  end
    
  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
