module InformationOutput
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
