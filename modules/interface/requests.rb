module Requests
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
end
