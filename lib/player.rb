require_relative 'deck'

class Player
  attr_accessor :score, :holding_cards

  def initialize
    @score = 0
    @holding_cards = []
  end

  def decide
  end

  def print_holding_cards
    @total_cards = @holding_cards.count

    @total_cards.times { print " " + "-" * 4 + "       " } # Row 1
    puts "\n"
    @total_cards.times { print "|" + " " * 4 + "|" + "      " } # Row 2
    puts "\n"

    @holding_cards.each do |card|
      if card.card_value < 10
        print "|" + "  #{card.card_value.to_s} " + "|" + "      " # Row 3
      else
        print "|" + " #{card.card_value.to_s} " + "|" + "      " # Row 3
      end
    end
    puts "\n"
    @total_cards.times { print "|" + " " * 4 + "|" + "      " } # Row 2
    puts "\n"
    @total_cards.times { print " " + "-" * 4 + "       " } # Row 5
    puts "\n"
  end
end
