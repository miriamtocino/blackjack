require_relative 'player'
require_relative 'deck'

class Hand < Player
  def initialize

    super()
  end

  def decide
    answer = ""
    while answer != "y" && answer != "n"
      puts "Do you want another card? (y/n)"
      answer = gets.chomp
      if answer == "y"
        return true
      elsif answer == "n"
        return false
      end
    end
  end

  def receive_card(card)
    @score += card.card_value
    @holding_cards << card
    puts "This is the card you got: " + card.name
    puts "And your current score is: " + @score.to_s
  end
end
