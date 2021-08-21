require_relative 'interface'
require_relative 'player'
require_relative 'hand'
require_relative 'card'
require_relative 'deck'

class Game
  BASIC_MONEY = 100
  BET_VALUE = 10

  def initialize
    self.interface = Interface.new
  end

  def start
    preparation
    process
  end

  private

  attr_accessor :interface, :player, :dealer, :deck, :game_bank

  def preparation
    create_player
    create_dealer
    create_deck
  end

  def create_player
    loop do
      self.player = Player.new(interface.request_player_name)
      break unless player.name.empty?

      interface.wrong_name_alert
    end
  end

  def create_dealer
    self.dealer = Player.new
  end

  def create_deck
    self.deck = Deck.new
  end

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
