require_relative 'information_output'

module PlayRound
  include InformationOutput

  private

  def play_round
    distribution_cards
    loop do
      break if player_choice
    end
  end

  def distribution_cards
    puts 'Раздаем карты...'
    2.times do
      deal_card(player)
      deal_card(dealer)
    end
  end

  def deal_card(player)
    player.take_card(deck.give_card)
  end

  def player_choice
    if player.hand.size == 2
      round_information_output
      two_card_choice
    elsif player.hand.size == 3 && dealer.hand.size == 3
      open_cards
    else
      round_information_output
      three_card_choice
    end
  end

  def two_card_choice
    loop do
      puts 'Выберите действие (1. Пропустить/2. Взять карту/3. Открыть карты):'
      choice = gets.to_i
      case choice
      when 1
        return pass
      when 2
        return take_card
      when 3
        return open_cards
      else
        puts 'Ответ не распознан...'
      end
    end
  end

  def three_card_choice
    loop do
      puts 'Выберите действие (1. Пропустить/2. Открыть карты):'
      choice = gets.to_i
      case choice
      when 1
        return pass
      when 2
        return open_cards
      else
        puts 'Ответ не распознан...'
      end
    end
  end

  def pass
    puts "#{player.name} пропускает ход..."
    dealer_choice
  end

  def take_card
    deal_card(player)
    puts "#{player.name} получает карту #{player.hand[-1].join}..."
    dealer_choice
  end

  def open_cards
    final_information_output
    calculating_result
    true
  end

  def dealer_choice
    if dealer.hand_value >= 17 || dealer.hand.size == 3
      puts "#{dealer.name} пропускает ход..."
    else
      deal_card(dealer)
      puts "#{dealer.name} берет карту..."
    end
  end

  def calculating_result
    if player.hand_value > 21
      player_lose_round
    elsif dealer.hand_value > 21
      player_win_round
    elsif player.hand_value > dealer.hand_value
      player_win_round
    elsif player.hand_value < dealer.hand_value
      player_lose_round
    else
      round_draw
    end
  end

  def player_win_round
    player.take_money(game_bank)
    puts "#{player.name} выигрывает раунд..."
  end

  def player_lose_round
    dealer.take_money(game_bank)
    puts "#{player.name} проигрывает раунд..."
  end

  def round_draw
    dealer.take_money(game_bank / 2)
    player.take_money(game_bank / 2)
    puts 'Ничья...'
  end
end
