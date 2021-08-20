module Preparation
  private

  def preparation
    create_player
    create_dealer
    create_deck
  end

  def create_player
    loop do
      self.player = Player.new(interface.request_player_name)
      break unless player.name.empty?

      interface.wrong_name_alert
    end
  end

  def create_dealer
    self.dealer = Player.new
  end

  def create_deck
    self.deck = Deck.new
  end
end
