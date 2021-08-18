require_relative './process/play_round'

module Process
  include PlayRound

  private

  BASIC_MONEY = 100
  BET_VALUE = 10

  def process
    loop do
      refresh_banks
      play
      break unless play_again?
    end
    puts 'Игра окончена.'
  end

  def refresh_banks
    player.refresh_bank(BASIC_MONEY)
    dealer.refresh_bank(BASIC_MONEY)
    self.game_bank = 0
  end

  def play
    loop do
      making_bets
      play_round
      break if break_check
    end
  end

  def play_again?
    loop do
      puts 'Хотите начать игру заново? (Да/Нет)'
      choice = gets.chomp.downcase
      case choice
      when 'да'
        return true
      when 'нет'
        return false
      else
        'Ответ не распознан.'
      end
    end
  end

  def making_bets
    puts 'Делаем ставки'
    player.make_bet(BET_VALUE)
    dealer.make_bet(BET_VALUE)
    self.game_bank = BET_VALUE * 2
  end

  def break_check
    if player.bank.zero?
      player_lose_alert
      true
    elsif dealer.bank.zero?
      player_win_alert
      true
    elsif !one_more?
      true
    end
  end

  def player_lose_alert
    puts "Игрок #{player.name} проиграл."
  end

  def player_win_alert
    puts "Игрок #{player.name} выиграл."
  end

  def one_more?
    loop do
      puts 'Хотите сыграть еще один раунд? (Да/Нет)'
      choice = gets.chomp.downcase
      case choice
      when 'да'
        return true
      when 'нет'
        return false
      else
        'Ответ не распознан.'
      end
    end
  end
end
