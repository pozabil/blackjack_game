module Preparation
  private

  def preparation
    create_player
    create_dealer
    create_deck
  end

  def create_player
    loop do
      self.player = Player.new(player_name)
      break unless player.name.empty?

      puts 'Неверное имя игрока.'
    end
  end

  def create_dealer
    self.dealer = Player.new
  end

  def create_deck
    self.deck = Deck.new
  end

  def player_name
    print 'Введите имя игрока: '
    gets.chomp.capitalize
  end
end
