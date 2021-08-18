class Player
  attr_reader :name, :bank, :hand

  def initialize(name = nil)
    @name = name
    @hand = []
  end

  def refresh_bank(basic_money)
    self.bank = basic_money
  end

  def make_bet(bet)
    self.bank -= bet
  end

  def take_card(card)
    hand << card
  end

  private

  attr_writer :bank, :hand
end
