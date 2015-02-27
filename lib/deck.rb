require_relative 'card'

class Deck
  attr_reader :cards_collection, :cards_discarded

  def initialize
    @cards_collection = []
    @cards_discarded = []
    reset
  end

  def reset
    suits = [Card::POLO_STICKS, Card::COINS, Card::SWORDS, Card::CUPS]
    suits.each do |suit|
      Card::FACE_OPTIONS.each do |card|
        @cards_collection << Card.new(suit, card.first)
      end
    end
    @cards_collection.shuffle!
  end

  def draw
    card = @cards_collection.first
    @cards_discarded << card
    @cards_collection.shift
    return card
  end
end
