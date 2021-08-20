module Alerts
  def wrong_name_alert
    puts "Неверное имя игрока...\n\n"
  end

  def wrong_answer_alert
    puts "Ответ не распознан...\n\n"
  end

  def game_exit_alert
    system 'clear'
    puts "Игра окончена.\n\n"
  end

  def making_bets_alert
    puts "Делаем ставки...\n\n"
  end

  def distribution_cards_alert
    puts "Раздаем карты...\n\n"
  end

  def pass_alert(player)
    puts "#{player.name} пропускает ход...\n\n"
  end

  def take_card_alert(player)
    puts "#{player.name} получает карту #{player.hand.cards[-1]}...\n\n"
  end

  def closed_take_card_alert(player)
    puts "#{player.name} берет карту...\n\n"
  end

  def player_lose_alert(player)
    puts "Игрок #{player.name} проигрывает игру.\n\n"
  end

  def player_win_alert(player)
    puts "Игрок #{player.name} выигрывает игру.\n\n"
  end

  def player_lose_round_alert(player)
    puts "#{player.name} проигрывает раунд...\n\n"
  end

  def player_win_round_alert(player)
    puts "#{player.name} выигрывает раунд...\n\n"
  end

  def round_draw_alert
    puts "Ничья...\n\n"
  end
end
