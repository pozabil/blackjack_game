require_relative 'play_round'

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
    interface.game_exit_alert
  end

  def refresh_banks
    player.refresh_bank(BASIC_MONEY)
    dealer.refresh_bank(BASIC_MONEY)
    self.game_bank = 0
  end

  def play
    loop do
      refresh_hands
      deck.shuffle!
      making_bets
      play_round
      break if break_check
    end
  end

  def refresh_hands
    player.hand.refresh!
    dealer.hand.refresh!
  end

  def play_again?
    interface.request_play_again?
  end

  def making_bets
    interface.making_bets_alert
    player.make_bet(BET_VALUE)
    dealer.make_bet(BET_VALUE)
    self.game_bank = BET_VALUE * 2
  end

  def break_check
    if player.bank.zero?
      interface.player_lose_alert(player)
      true
    elsif dealer.bank.zero?
      interface.player_win_alert(player)
      true
    elsif !one_more?
      true
    end
  end

  def one_more?
    interface.request_one_more?
  end
end
