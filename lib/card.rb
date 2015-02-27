class Card
  attr_reader :card_value

  POLO_STICKS = "Polo Sticks"
  COINS = "Coins"
  SWORDS = "Swords"
  CUPS = "Cups"

  FACE_OPTIONS = {
    "As" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "10" => 10,
    "Jack" => 10,
    "Queen" => 10,
    "King" => 10
  }

  def initialize(suit, face)
    @card_value = FACE_OPTIONS[face]
    @suit = suit
    @face = face
  end

  def name
    @face.to_s + " of " + @suit.to_s
  end

  def print_card
    puts " " + "-" * 4
    puts "|" + " " * 4 + "|"
    if @card_value < 10
      puts "|" + "  #{@card_value.to_s} " + "|"
    else
      puts "|" + " #{@card_value.to_s} " + "|"
    end
    puts "|" + " " * 4 + "|"
    puts " " + "-" * 4
  end
end
