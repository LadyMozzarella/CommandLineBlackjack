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
    @cards = unshift(@cards.pop(rand(@cards.length)))
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
  #calls


end


class CardView



end


#handview for player
# --> calls cardview for all of the cards in the hand??
# also need to display the score.




######CONTROLLER#######
class Controller
  def run
    # Welcome to blackjack.
    # Create the deck
    # Shuffle the deck
    # Cut the deck
    # Create hand for player
    # Create hand for dealer
    # Give one card to Player
##  # Display message saying which card
    # Give one card to Dealer
    # Give another card to Player
##  # Display message saying which card
    # Give another card to Dealer
##  # Display message saying score of one of the cards
##  # Tell the Player his/her score. (maybe?)
    # Ask if they want to hit or stay
    # UNTIL STAY OR BUST:
    # (said hit) HIT:
      # Give another card to Player
##    # Display message for which card it was
      # Run busted?
    # WHEN THEY STAY
      # Reveal the Dealer cards.
      # Until Dealer score is 17 or more,
      #   keep giving the Dealer more cards
      # Run busted? each time.
      #

## Need message for bust.
## Need a message for blackjack.
    #calls Handview
  end
end









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
