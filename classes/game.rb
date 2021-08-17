class Game
  def start
    preparation
    loop do
      game
    end
  end

  def preparation
    create_player
    create_dealer
  end

  def game
  end
end
