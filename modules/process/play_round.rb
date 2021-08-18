module PlayRound
  private

  def play_round
    distribution_cards
    loop do
      calculating_points
      break unless player_choice
    end
    calculating_points
  end

  def distribution_cards
    puts 'Раздаем карты'
    2.times do
      deal_card(player)
      deal_card(dealer)
    end
  end

  def deal_card(player)
    player.take_card(deck.give_card)
  end

  def calculating_points
    # body
  end

  def player_choice
    loop do
      print 'Выберите действие (1. Пропустить/2. Взять карту/3. Открыть карты): '
      choice = gets.to_i
      case choice
      when 1
        pass
        break
      when 2
        take_card
        break
      when 3
        open_cards
        break
      else
        'Ответ не распознан.'
      end
    end
  end

  def pass
    puts 'choice_1'
  end

  def take_card
    puts 'choice_2'
  end

  def open_cards
    puts 'choice_3'
  end
end
