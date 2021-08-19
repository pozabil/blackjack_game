class Deck
  SUITS = ["\u2660", "\u2663", "\u2665", "\u2666"].freeze
  RANKS = (2..10).to_a.map!(&:to_s) + %w[J Q K A]
  COMPOSITION = []; RANKS.each { |rank| SUITS.each { |suit| COMPOSITION << [rank, suit] } }

  attr_reader :cards

  def initialize
    shuffle!
  end

  def shuffle!
    self.cards = COMPOSITION.dup
    rand(2..6).times { cards.shuffle! }
  end

  def give_card
    cards.pop
  end

  private

  attr_writer :cards
end
