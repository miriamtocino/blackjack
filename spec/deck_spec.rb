require 'spec_helper'
require 'card'
require 'deck'

describe "A deck" do
  it "contains 52 cards" do
    deck = Deck.new
    expect(deck.cards_collection.count).to eq(52)
  end

  it "draws its first card and includes it into the discarded cards" do
    deck = Deck.new
    10.times do
      card = deck.draw
      expect(card).to eq(deck.cards_discarded.last)
    end
    expect(deck.cards_discarded.size).to eq(10)
  end
end
