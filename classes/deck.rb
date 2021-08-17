class Deck
  SUITS = ["\u2660", "\u2663", "\u2665", "\u2666"].freeze
  RANKS = (2..10).to_a.map!(&:to_s) + ['J', 'Q', 'K', 'A']
  DECK = []; RANKS.each { |rank| SUITS.each { |suit| DECK << rank + suit } }

  attr_reader :cards

  def initialize
    shuffle!
  end

  def shuffle!
    self.cards = DECK
    rand(2..6).times { cards.shuffle! }
  end

  private

  attr_writer :cards
end
