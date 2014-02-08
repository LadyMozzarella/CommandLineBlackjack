#######MODEL######
class StandardDeckConstructor
  CARDS = {
    :ace    => 11,
    :two    => 2,
    :three  => 3,
    :four   => 4,
    :five   => 5,
    :six    => 6,
    :seven  => 7,
    :eight  => 8,
    :nine   => 9,
    :ten    => 10,
    :jack   => 10,
    :queen  => 10,
    :king   => 10
  }

  def self.make_deck
    cards = []
    4.times do #because we have 4 suits
      CARDS.each do |name, value|
        cards << Card.new(name, value)
      end
    end
    cards
  end
end

class Deck
  def initialize(cards = [])
    @cards = cards
  end

  def add_standard_deck
    @cards += StandardDeckConstructor.make_deck
  end

  def shuffle
    @cards.shuffle!
  end

  def cut
    @cards.unshift(@cards.pop(rand(@cards.length))).flatten!
  end
end

class Card
  def initialize(name, value)
    @name = name
    @value = value
  end

  def get_name
    @name
  end

  def get_value
    @value
  end
end

class Hand
  attr_reader :cards
  def initialize
    @cards = []
    @score = 0
    @high_ace_count = 0
  end

  def add_card(card)
    @cards << card
    @score += card.get_value
    @high_ace_count += 1 if card.get_value == 11
  end

  def check_score
    @score
  end

  def bust?
    if @score <= 21
      false
    else
      if @high_ace_count > 0
        @score -= 10
        @high_ace_count -= 1
        bust?
      else
        true
      end
    end
  end
end

######VIEW######
class HandView

  def self.dealer_hand(hand)

    line1 = ""
    line2 = ""
    line3 = ""
    line4 = ""
    line5 = ""

    hand.length.times do |card|
      current_card = CardView.new(hand[card])
      card == 0 ? breaking_up_display = current_card.hidden_card.split("\n") : breaking_up_display = current_card.show_card.split("\n")
      line1 << "   " << "#{breaking_up_display[0]}"
      line2 << "   " << breaking_up_display[1]
      line3 << "   " << breaking_up_display[2]
      line4 << "   " << breaking_up_display[3]
      line5 << "   " << breaking_up_display[4]
    end
    "#{line1}\n#{line2}\n#{line3}\n#{line4}\n#{line5}"
  end

  def self.player_hand(hand)

    line1 = ""
    line2 = ""
    line3 = ""
    line4 = ""
    line5 = ""

    hand.length.times do |card|
      current_card = CardView.new(hand[card])
      breaking_up_display = current_card.show_card.split("\n")
      line1 << "   " << "#{breaking_up_display[0]}"
      line2 << "   " << breaking_up_display[1]
      line3 << "   " << breaking_up_display[2]
      line4 << "   " << breaking_up_display[3]
      line5 << "   " << breaking_up_display[4]
    end
    "#{line1}\n#{line2}\n#{line3}\n#{line4}\n#{line5}"
  end
end


class CardView
  def initialize(card)
    @card = card
  end

  def hidden_card
    "+-----+\n|*****|\n|*****|\n|*****|\n+-----+"
  end

  def show_card
    "+-----+\n|     |\n|#{@card.get_name.to_s.upcase.ljust(5)}|\n|     |\n+-----+"
  end
end

######CONTROLLER#######
class Controller

  def run
    puts welcome
    response = true
    while response
      run_hand
      response = get_input("Do you want to play again y/n" , true, true ) == "y"
    end
  end

  def run_hand
    system "clear" unless system "cls"
    @deck = prepare_deck
    @player_hand = Hand.new
    @dealer_hand = Hand.new

    deal_starting_hands
    puts HandView.dealer_hand(@dealer_hand.cards)
    puts HandView.player_hand(@player_hand.cards)


    while get_input("hit or stay", true) == "hit" && (!@player_hand.bust?)
      #Added a wehatever card message
      add_card_to_hand(@player_hand)
      if @player_hand.bust?
        get_input( "You lose! Press enter.", true, true)
        return
      end
    end



    while @dealer_hand.check_score < 17
      @dealer_hand.add_card(@deck.pop)
    end
    if @dealer_hand.bust?
      get_input( "Dealer loses! Press enter.", true, true)
      return
    else
      if @dealer_hand.check_score >= @player_hand.check_score
        get_input( "Dealer wins! Press enter.", true, true)
      else
        get_input( "Player wins! Press enter.", true, true)
      end
    end
  end

  def get_input(msg_to_ask_for_input, display_hands = false, show_dealer = false)
    system "clear" unless system "cls"

    puts "\n\n   DEALER HAND \n#{HandView.dealer_hand(@dealer_hand.cards)}" if display_hands && !show_dealer
    puts "\n\n   DEALER HAND \n#{HandView.player_hand(@dealer_hand.cards)}" if display_hands && show_dealer
    puts "\n\n   PLAYER HAND \n#{HandView.player_hand(@player_hand.cards)}\n\n" if display_hands
    puts msg_to_ask_for_input
    gets.chomp
  end

  def welcome
    "Welcome! Let's play some Blackjack!"
  end

  def prepare_deck
    @deck = Deck.new
    @deck.add_standard_deck
    @deck.shuffle
    @deck.cut
  end

  def deal_starting_hands
    @player_hand.add_card(@deck.pop)
    @dealer_hand.add_card(@deck.pop)
    @player_hand.add_card(@deck.pop)
    @dealer_hand.add_card(@deck.pop)
  end

  def add_card_to_hand(hand)
    hand.add_card(@deck.pop)
  end

  def ask_to_hit
    "Hit or stay?"
  end

  def hit_me?
    puts ask_to_hit
    case gets.chomp
    when 'hit', 'h'
      true
    when 'stay','s'
      false
    else
      puts "I don't understand. Hit or stay?"
      hit_me?(gets.chomp)
    end
  end
end

blackjack = Controller.new
blackjack.run







#next steps:
# Hand view
#   format the data of the hand into the string
#   controller will be able to print them.
# Controller
# Card View
# Dealer
# Player (may not need at all--might just be input)

# card1 = Card.new(:ace,11)
# card2 = Card.new(:nine, 9)
# hand = Hand.new
# hand.add_card(card1)
# p hand.check_score
# hand.add_card(card2)
# p hand.check_score
# p hand.bust?
# hand.add_card(Card.new(:five, 5))
# p hand.bust?
# p hand.check_score
# hand.add_card(Card.new(:ten, 10))
# p hand.bust?

# deck = Deck.new
# p deck.add_standard_deck
