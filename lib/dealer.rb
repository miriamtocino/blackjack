require_relative 'player'

class Dealer < Player

  MAX_DECIDE_SCORE = 17

  def initialize
    super()
  end

  def decide
    @score < MAX_DECIDE_SCORE
  end

  def receive_card(card)
    @score += card.card_value
    @holding_cards << card
    puts "CHEATING: Dealer receives: " + card.name + ". Card value: " + card.card_value.to_s
    print_details
  end

  def print_details
    unless @holding_cards.count == 1
      if @holding_cards.count == 2
        puts "One of the cards that the dealer got is: " + @holding_cards.last.name
        puts "And his partial score is: " + @holding_cards.last.card_value.to_s
      else
        puts "The dealer got the card: " + @holding_cards.last.name
        puts "And his current score is: " + @score.to_s
      end
    end
  end
end
