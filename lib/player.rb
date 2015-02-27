require_relative 'deck'

class Player
  attr_accessor :score, :holding_cards

  def initialize
    @score = 0
    @holding_cards = []
  end

  def decide
  end
end
