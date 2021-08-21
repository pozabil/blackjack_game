class Interface
  def initialize
    system 'clear'
  end

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

  def request_player_name
    puts 'Введите имя игрока:'
    gets.chomp.capitalize
  end

  def request_play_again?
    loop do
      puts 'Хотите начать игру заново? (Да/Нет):'
      choice = gets.chomp.downcase
      case choice
      when 'да'
        return true
      when 'нет'
        return false
      else
        wrong_answer_alert
      end
    end
  end

  def request_one_more?
    loop do
      puts 'Хотите сыграть еще один раунд? (Да/Нет):'
      choice = gets.chomp.downcase
      case choice
      when 'да'
        return true
      when 'нет'
        return false
      else
        wrong_answer_alert
      end
    end
  end

  def request_two_card_choice
    loop do
      puts 'Выберите действие (1. Пропустить/2. Взять карту/3. Открыть карты):'
      choice = gets.to_i
      case choice
      when 1
        return 'pass'
      when 2
        return 'take_card'
      when 3
        return 'open_cards'
      else
        wrong_answer_alert
      end
    end
  end

  def request_three_card_choice
    loop do
      puts 'Выберите действие (1. Пропустить/2. Открыть карты):'
      choice = gets.to_i
      case choice
      when 1
        return 'pass'
      when 2
        return 'open_cards'
      else
        wrong_answer_alert
      end
    end
  end

  def round_information(player, dealer)
    closed_player_information(dealer)
    open_player_information(player)
  end

  def final_information(player, dealer)
    open_player_information(dealer)
    open_player_information(player)
  end

  def closed_player_information(player)
    puts "#{player.name}: #{player.hand.cards.map { '*  ' }.join}"
    puts '  Сумма очков: ??'
    puts "    Банк: #{player.bank} $\n\n"
  end

  def open_player_information(player)
    puts "#{player.name}: #{player.hand.cards.map { |card| "#{card} " }.join}"
    puts "  Сумма очков: #{player.hand.value}"
    puts "    Банк: #{player.bank} $\n\n"
  end
end
