require_relative 'game'

game = Game.new
game_is_finished = false

# HAND TURN
puts "*" * 40
puts "HAND'S TURN"
while !game_is_finished && game.do_you_want_a_card(game.hand)
  game.give_card_to_hand

  # HAND TURN'S RESOLUTION
  if game.hand.score > 21
    puts "You lost, your current score is higher than 21: #{game.hand.score.to_s}"
    game_is_finished = true
  end
end

unless game_is_finished == true
  # DEALER TURN
  puts "*" * 40
  puts "DEALER'S TURN"
  while !game_is_finished && game.do_you_want_a_card(game.dealer)
    game.give_card_to_dealer

    # DEALER TURN'S RESOLUTION
    if game.dealer.score > 21
      puts "You won! The dealer's score is higher than 21: #{game.dealer.score.to_s}"
      game_is_finished = true
    end
  end

  unless game_is_finished == true
    # FINAL RESOLUTION
    puts "*" * 40
    puts "GAME'S RESOLUTION"
    puts "Hand Score: #{game.hand.score.to_s}"
    puts "Dealer Score: #{game.dealer.score.to_s}"
    if game.dealer.score > game.hand.score
      puts "You lost, the dealer's score is higher than yours."
    else
      puts "You won, the dealer's score is lower than yours."
    end
    game_is_finished = true
  end
end
