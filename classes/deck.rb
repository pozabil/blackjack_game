class Deck
  SUITS = ["\u2660", "\u2663", "\u2665", "\u2666"].freeze
  RANKS = (2..10).to_a.map!(&:to_s) + %w[J Q K A]

  attr_reader :cards

  def initialize
    shuffle!
  end

  def shuffle!
    generate
    cards.shuffle!
  end

  def generate
    self.cards = []
    RANKS.each { |rank| SUITS.each { |suit| cards << Card.new(rank, suit) } }
  end

  def give_card
    cards.pop
  end

  private

  attr_writer :cards
end
