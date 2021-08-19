require_relative 'player'
require_relative 'deck'
require_relative '../modules/preparation'
require_relative '../modules/process'

class Game
  include Preparation
  include Process

  def start
    system 'clear'
    puts
    preparation
    process
  end

  private

  attr_accessor :player, :dealer, :deck, :game_bank
end
