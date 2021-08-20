class Player
  attr_reader :name, :bank
  attr_accessor :hand

  def initialize(name = 'Дилер')
    @name = name
    @hand = Hand.new
  end

  def refresh_bank(basic_money)
    self.bank = basic_money
  end

  def make_bet(bet)
    self.bank -= bet
  end

  def take_money(money)
    self.bank += money
  end

  private

  attr_writer :bank
end
