class Player
  attr_accessor :cards
  def initialize
    @cards = []
  end

  def busted?
    return true if total > 21
    false
  end

  def total
    total = 0
    aces = 0
    cards.each do |card|
      if card.values == 11
        aces += 1
      end
      total += card.values
    end
    aces.times do
      total -= 10 if total > 21
    end
    total
  end
end

class Card
  attr_accessor :card
  SUIT = ['Hearts', 'Clubs', 'Diamonds', 'Spades'].freeze
  VALUE = ['Ace', 'King', 'Queen', 'Jack', '10', '9', '8', '7', '6', '5', '4', '3', '2'].freeze
  GET_TOTAL = { 'Ace' => 11, 'King' => 10, 'Queen' => 10, 'Jack' => 10, '10' => 10, '9' => 9, '8' => 8, '7' => 7, '6' => 6, '5' => 5, '4' => 4, '3' => 3, '2' => 2 }.freeze
  def initialize
    @card = { suit: SUIT.sample, value: VALUE.sample }
  end

  def to_s
    puts "#{card[:value]} of #{card[:suit]}"
  end

  def values
    GET_TOTAL[card[:value]]
  end
end

class Game
  attr_accessor :human, :dealer

  def initialize
    @dealer = Player.new
    @human = Player.new
  end

  def start
    deal_cards
    hide_dealers_cards
    player_turn
    dealer_turn
    show_result
    check_winner
  end

  def check_winner
    if human.total > 21 || (dealer.total < 21 && dealer.total > human.total)
      puts "Dealer won!\n"
    elsif dealer.total <= 21 && dealer.total == human.total
      puts "Tie.\n"
    else
      puts "You won!\n"
    end
  end

  def show_result
    print "Your total: #{human.total}\n"
    print "Dealer total: #{dealer.total}\n"
  end

  def dealer_turn
    return if human.busted?
    loop do
      show_all_cards
      break if dealer.total > 16
      dealer.cards << Card.new
      break if dealer.busted?
    end
  end

  def player_turn
    loop do
      print "hit or stand [h/s]? "
      choice = gets.chomp
      break if choice == 's'
      human.cards << Card.new
      hide_dealers_cards
      break if human.busted?
    end
  end

  def hide_dealers_cards
    system 'clear'
    show_first_dealer_card
    show_human_cards
  end

  def show_all_cards
    system 'clear'
    show_dealer_cards
    show_human_cards
  end

  def show_human_cards
    puts "\n---- Your Cards ----"
    human.cards.each(&:to_s)
  end

  def show_dealer_cards
    puts "\n---- Dealer Cards ----"
    dealer.cards.each(&:to_s)
  end

  def show_first_dealer_card
    puts "\nDealer card showing:"
    dealer.cards[0].to_s
    puts ''
  end

  def deal_cards
    human.cards = [Card.new, Card.new]
    dealer.cards = [Card.new, Card.new]
  end
end

Game.new.start
