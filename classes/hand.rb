class Hand
  attr_reader :cards

  def refresh!
    self.cards = []
  end

  def take_card(card)
    cards << card
  end

  def size
    cards.size
  end

  def value
    hand_ranks = []
    cards.each { |card| hand_ranks << card.rank }
    calculate_value(hand_ranks)
  end

  private

  attr_writer :cards

  def calculate_value(hand_ranks)
    value = 0
    hand_ranks.each { |rank| value += card_value(rank) }
    if hand_ranks.include?('A')
      loop do
        break if value <= 21

        value = 0
        hand_ranks[hand_ranks.index('A')] = '1'
        hand_ranks.each { |rank| value += card_value(rank) }
      end
    end
    value
  end

  def card_value(rank)
    if rank == 'A'
      11
    elsif rank.to_i.zero?
      10
    else
      rank.to_i
    end
  end
end
