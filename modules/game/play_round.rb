module PlayRound
  private

  def play_round
    distribution_cards
    loop do
      break if player_choice
    end
  end

  def distribution_cards
    interface.distribution_cards_alert
    2.times do
      deal_card(player)
      deal_card(dealer)
    end
  end

  def deal_card(player)
    player.hand.take_card(deck.give_card)
  end

  def player_choice
    if player.hand.size == 2
      interface.round_information(player, dealer)
      two_card_choice
    elsif player.hand.size == 3 && dealer.hand.size == 3
      open_cards
    else
      interface.round_information(player, dealer)
      three_card_choice
    end
  end

  def two_card_choice
    send(interface.request_two_card_choice)
  end

  def three_card_choice
    send(interface.request_three_card_choice)
  end

  def pass
    interface.pass_alert(player)
    dealer_choice
  end

  def take_card
    deal_card(player)
    interface.take_card_alert(player)
    dealer_choice
  end

  def open_cards
    interface.final_information(player, dealer)
    calculating_result
    true
  end

  def dealer_choice
    if dealer.hand.value >= 17 || dealer.hand.size == 3
      interface.pass_alert(dealer)
    else
      deal_card(dealer)
      interface.closed_take_card_alert(dealer)
    end
  end

  def calculating_result
    if player.hand.value > 21
      player_lose_round
    elsif dealer.hand.value > 21
      player_win_round
    elsif player.hand.value > dealer.hand.value
      player_win_round
    elsif player.hand.value < dealer.hand.value
      player_lose_round
    else
      round_draw
    end
  end

  def player_win_round
    player.take_money(game_bank)
    interface.player_win_round_alert(player)
  end

  def player_lose_round
    dealer.take_money(game_bank)
    interface.player_lose_round_alert(player)
  end

  def round_draw
    dealer.take_money(game_bank / 2)
    player.take_money(game_bank / 2)
    interface.round_draw_alert
  end
end
