require_relative 'interface'
require_relative 'player'
require_relative 'hand'
require_relative 'card'
require_relative 'deck'
require_relative '../modules/game/preparation'
require_relative '../modules/game/process'

class Game
  include Preparation
  include Process

  def initialize
    self.interface = Interface.new
  end

  def start
    preparation
    process
  end

  private

  attr_accessor :interface, :player, :dealer, :deck, :game_bank
end
