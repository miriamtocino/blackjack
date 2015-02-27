require_relative 'deck'

class Player
  attr_accessor :score, :holding_cards, :hide_first_card

  def initialize
    @score = 0
    @holding_cards = []
    @hide_first_card = false
  end

  def decide
  end

  def receive_card(card)
    @score += card.card_value
    @holding_cards << card
  end

  def print_holding_cards
    if @hide_first_card
      puts "PARTIAL SCORE: " + @holding_cards.last.card_value.to_s
    else
      puts "CURRENT SCORE: " + @score.to_s
    end

    @total_cards = @holding_cards.count

    @total_cards.times { print " " + "-" * 4 + "       " } # Row 1
    puts "\n"
    @total_cards.times { print "|" + " " * 4 + "|" + "      " } # Row 2
    puts "\n"

    @holding_cards.each_with_index do |card, index|
      if @hide_first_card && index == 0
        print "|" + "  ? " + "|" + "      "
      else
        if card.card_value < 10
          print "|" + "  #{card.card_value.to_s} " + "|" + "      " # Row 3
        else
          print "|" + " #{card.card_value.to_s} " + "|" + "      " # Row 3
        end
      end
    end

    puts "\n"
    @total_cards.times { print "|" + " " * 4 + "|" + "      " } # Row 2
    puts "\n"
    @total_cards.times { print " " + "-" * 4 + "       " } # Row 5
    puts "\n"
  end
end
