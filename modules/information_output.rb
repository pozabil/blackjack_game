module InformationOutput
  private

  def round_information_output
    puts
    closed_information_output(dealer)
    open_information_output(player)
  end

  def final_information_output
    puts
    open_information_output(dealer)
    open_information_output(player)
  end

  def closed_information_output(dealer)
    puts "#{dealer.name}: #{dealer.hand.map { '* ' }.join}"
    puts '  Сумма очков: ??'
    puts "    Банк: #{dealer.bank} $"
    puts
  end

  def open_information_output(player)
    puts "#{player.name}: #{player.hand.map { |card| "#{card.join} " }.join}"
    puts "  Сумма очков: #{player.hand_value}"
    puts "    Банк: #{player.bank} $"
    puts
  end
end
