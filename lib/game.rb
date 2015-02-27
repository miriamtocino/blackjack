require_relative 'deck'
require_relative 'hand'
require_relative 'dealer'

class Game
  attr_accessor :hand, :dealer

  def initialize
    puts "WELCOME TO BLACKJACK!"
    puts "*" * 40
    @deck = Deck.new
    @hand = Hand.new
    @dealer = Dealer.new

    2.times do
      give_card_to_hand
    end

    puts "*" * 40

    2.times do
      give_card_to_dealer
    end
  end

  def do_you_want_a_card(player)
    player.decide
  end

  def give_card_to_hand
    card = @deck.draw
    @hand.receive_card(card)
  end

  def give_card_to_dealer
    card = @deck.draw
    @dealer.receive_card(card)
  end
end
