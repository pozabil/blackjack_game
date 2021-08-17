class Player

  BASIC_MONEY = 100

  attr_reader :name, :bank
  attr_accessor :hand

  def initialize(name)
    @name = name
    @bank = BASIC_MONEY
    @hand = []
  end
end