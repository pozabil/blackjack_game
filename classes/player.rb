class Player
  attr_reader :name, :bank, :hand

  def initialize(name = 'Дилер')
    @name = name
  end

  def refresh_bank(basic_money)
    self.bank = basic_money
  end

  def refresh_hand
    self.hand = []
  end

  def make_bet(bet)
    self.bank -= bet
  end

  def take_money(money)
    self.bank += money
  end

  def take_card(card)
    hand << card
  end

  def hand_value
    hand_ranks = []
    hand.each { |card| hand_ranks << card[0] }
    hand_ranks.sort_by! { |rank| rank == 'A' ? 1 : 0 }
    calculate_hand_value(hand_ranks)
  end

  private

  def calculate_hand_value(hand_ranks)
    hand_value = 0
    hand_ranks.each { |rank| hand_value += card_value(rank) }
    if hand_ranks.include?('A')
      loop do
        break if hand_value <= 21

        hand_value = 0
        hand_ranks[hand_ranks.index('A')] = '1'
        hand_ranks.each { |rank| hand_value += card_value(rank) }
      end
    end
    hand_value
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

  attr_writer :bank, :hand, :hand_value
end
