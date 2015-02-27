require 'spec_helper'
require 'card'

describe "A card" do
  it "accepts suit values of Polo Sticks, Coins, Swords or Cups" do
    suits = [Card::POLO_STICKS, Card::COINS, Card::SWORDS, Card::CUPS]
    suits.each do |suit|
      card = Card.new(suit, "As")
      expect(card.name).to eq("As of #{suit}")
    end
  end

  it "rejects card when the face is not valid" do
    card = Card.new(Card::POLO_STICKS, "Monkey")
    expect(card.card_value).to eq(nil)
  end
end
