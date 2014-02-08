require 'colorize'

require 'pg'
class HighScores
  def self.add(name, gameswon, gamesplayed, winpercent)
    pg_connection = PG.connect( dbname: 'blackjack' )
    pg_connection.exec("
      insert into highscores
      values ('#{name}', '#{gameswon.to_s}', '#{gamesplayed.to_s}', '#{winpercent.to_s}');
    ")
  end

  def self.print
    pg_connection = PG.connect( dbname: 'blackjack' )
    pg_connection.exec("
      SELECT name, gameswon, gamesplayed, winpercent FROM highscores
      ORDER BY winpercent desc, gamesplayed
    ")
  end
end


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
    wins = 0
    losses = 0
    while response
      victorious = run_hand
      wins += 1 if victorious
      losses += 1 unless victorious
      response = get_input("Do you want to play again y/n" , true, true ) == "y"
    end
    if wins + losses > 2
      puts "you won #{wins} out of #{wins + losses} games"
      puts "do you want to enter your name in the high_scores? y/n"
      if gets.chomp == "y"
        win_percent = ( 100 * wins ) / ( wins + losses )
        puts "What's your name?"
        name = gets.chomp
        system "clear" unless system "cls"
        HighScores.add(name, wins, (wins+losses), win_percent)
        scores = HighScores.print
        high_scores_table = "     | Name       | Games Won  | \# of Games | Win \%      |\n"
        high_scores_table << "     +===================================================+\n"
        scores.each do |score|
          high_scores_table << "     |"
          score.each do |column|
            high_scores_table << " #{column[1].ljust(10)} |"
          end
          high_scores_table << "\n"
        end
        puts high_scores_table.yellow
        # HighScoresView.print_scores(HighScores.scores)
      else
        puts "You could have been great you know..."
      end
    else
      puts "you did not play enough to be in the high scores"
      puts "here be the high scores matey!"
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
      add_card_to_hand(@player_hand)
      if @player_hand.bust?
        get_input( "You lose! Press enter.", true, true)
        return false
      end
    end

    while @dealer_hand.check_score < 17
      @dealer_hand.add_card(@deck.pop)
    end
    if @dealer_hand.bust?
      get_input( "Dealer loses! Press enter.", true, true)
      return true
    else
      if @dealer_hand.check_score >= @player_hand.check_score
        get_input( "Dealer wins! Press enter.", true, true)
        return false
      else
        get_input( "Player wins! Press enter.", true, true)
        return true
      end
    end
  end

  def get_input(msg_to_ask_for_input, display_hands = false, show_dealer = false)
    system "clear" unless system "cls"

    puts "\n\n   DEALER HAND \n#{HandView.dealer_hand(@dealer_hand.cards)}".cyan if display_hands && !show_dealer
    puts "\n\n   DEALER HAND \n#{HandView.player_hand(@dealer_hand.cards)}".cyan if display_hands && show_dealer
    puts "\n\n   PLAYER HAND \n#{HandView.player_hand(@player_hand.cards)}\n\n".green if display_hands
    puts msg_to_ask_for_input.red
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

###ADD TO DATABASE:

###LIST DATABASE: