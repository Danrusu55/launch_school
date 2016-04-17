# Game of 21

puts "Welcome to the game 21"

# Get card method chooses a card at random from the deck
# 1 - 10 are number cards
# 11 - Jack, 12 - Queen, 13 - King, 14 - Ace
def deal_card
  card_value = rand(2..14)
  card_suit = rand(1..4)
  [card_value, card_suit]
end

# Print the cards to the screen in a fashion that allows the user
# to understand the card value.
def print_card(card)
  suit = ''
  case card[1]
  when 1
    suit = 'Clubs'
  when 2
    suit = 'Diamonds'
  when 3
    suit = 'Hearts'
  when 4
    suit = 'Spades'
  end

  case card[0]
  when 11
    return 'Jack of ' + suit
  when 12
    return 'Queen ' + suit
  when 13
    return 'King ' + suit
  when 14
    return 'Ace ' + suit
  end

  card[0].to_s + ' ' + suit
end

def card_value(card)
  return card[0] if card[0] <= 10
  return 10 if card[0] <= 13
  return 11 if card[0] == 14
end

def print_hand(card)
  card.each do |each_card|
    puts ' Card => ' + print_card(each_card)
  end
end

def calculate_score(cards)
  score = 0
  aces = 0
  # Add up score from cards that are not aces
  # and add up the number of aces
  cards.each do |card|
    if card_value(card) < 11
      score += card_value(card)
    else
      aces += 1
    end
  end
  # Work out whether aces should be 1 or 11 based on how close
  # the score will come to 21 without busting
  if aces == 0
    return score
  elsif aces > 0
    aces.times do
      if score + 11 > score + 1 && score + 11 <= 21
        score += 11
      else
        score += 1
      end
    end
  end
  score # return the score
end

def print_line
  puts "---------------------------------"
end

def print_dollars
  puts "\n$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
end

def dealers_turn(dealer, player)
  loop do # Dealers turn
    print_line
    dealer_score = calculate_score(dealer)

    puts "\nPLAYER'S HAND"
    print_hand(player)
    puts "\nDEALER'S HAND"
    print_hand(dealer)

    if dealer_score > 16
      return
    else
      puts "\nDealer taking card . . ."
      sleep(3)
      dealer << deal_card
    end
  end
end

def players_turn(dealer, player)
  loop do # Players turn
    print_line
    puts "\nDEALER'S HAND"
    puts " Card => #{print_card(dealer[0])} and one face down"
    player_score = calculate_score(player)
    puts "\nPLAYER'S HAND"
    print_hand(player)

    if player_score > 21
      puts "\nYou BUST!"
      return 'player_bust'
    else
      puts "\nType h to hit or s to stand?"
      choice = gets.chomp
    end

    if choice == 'h'
      player << deal_card
    elsif choice == 's'
      return 'dealers_turn'
    end
  end
end

def print_result(dealer, player, money)
  dealer_score = calculate_score(dealer)
  player_score = calculate_score(player)
  print_dollars
  puts "\nPLAYER'S HAND #{player_score}"
  print_hand(player)
  puts "\nDEALER'S HAND #{dealer_score}"
  print_hand(dealer)
  # Work out the winner
  if player_score > 21
    puts "\nPlayer bust ... Dealer wins!"
    money[0] += 3
    money[1] -= 3
  elsif player_score <= 21 && player_score > dealer_score
    puts "\nPlayer wins!"
    money[0] -= 3
    money[1] += 3
  elsif dealer_score <= 21 && dealer_score > player_score
    puts "\nDealer wins!"
    money[0] += 3
    money[1] -= 3
  elsif dealer_score > 21
    puts "\nDealer bust ... Player wins!"
    money[0] -= 3
    money[1] += 3
  else
    puts "\nDraw . . . "
  end
  print_dollars
end

# Initialize money array, dealer is money[0], player is money[1]
money = [21, 21]
loop do
  dealer = []
  player = []
  puts "\n => Dealer has $#{money[0]}"
  puts " => Player has $#{money[1]}\n\n"
  # End game when someone runs out of money
  if money[0] <= 0 || money[1] <= 0
    break
  end
  # Get dealer cards
  dealer << deal_card
  dealer << deal_card
  # Get player cards
  player << deal_card
  player << deal_card
  print_line
  # Players hand, stop if busted
  if players_turn(dealer, player) == 'player_bust'
    print_result(dealer, player, money)
    next
  end
  # Dealers hand
  dealers_turn(dealer, player)
  # Get the scores and work out the winner
  print_result(dealer, player, money)
end
