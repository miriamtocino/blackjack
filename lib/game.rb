require_relative 'deck'
require_relative 'hand'
require_relative 'dealer'

class Game

  def initialize
    puts "WELCOME TO BLACKJACK!"
    puts "*" * 40
    @deck = Deck.new
    @hand = Hand.new
    @dealer = Dealer.new
    @is_finished = false

    2.times do
      give_card_to(@hand)
    end
    puts "*" * 40
    2.times do
      give_card_to(@dealer)
    end
  end

  def update
    give_turn_to(@hand)
    give_turn_to(@dealer)
    resolution
  end

private

  def give_turn_to(player)
    puts "*" * 40 + "\n#{player.class.name.upcase} TURN" unless @is_finished
    while !@is_finished && player.decide
      give_card_to(player)

      if player.score > 21
        if player == @hand
          puts "*" * 40 + "\nYou lost, your current score is higher than 21: #{player.score.to_s}"
        elsif player == @dealer
          puts "*" * 40 + "\nYou won, the dealer's score is higher than 21: #{player.score.to_s}"
        end
        @is_finished = true
      end
    end
  end

  def give_card_to(player)
    card = @deck.draw
    player.receive_card(card)
  end

  def resolution
    unless @is_finished == true
      puts "*" * 40 + "\nGAME'S RESOLUTION"
      puts "Hand Score: #{@hand.score.to_s}"
      puts "Dealer Score: #{@dealer.score.to_s}"
      if @dealer.score > @hand.score
        puts "You lost, the dealer's score is higher than yours."
      else
        puts "You won, the dealer's score is lower than yours."
      end
    end

  end
end
