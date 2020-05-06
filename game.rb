# frozen_string_literal: true

# arr[rand(arr.size)] random arr value
class Game
  attr_accessor :deck, :player, :dealer

  def initialize(player_name)
    @player = Player.new(Hand.new, player_name)
    @dealer = Player.new(Hand.new, 'Dealer')
    @deck = Deck.new
  end

  def first_move
    @deck.mix
    @player.hand.clean
    @dealer.hand.clean
    give_cards(2, @dealer)
    give_cards(2, @player)
    @player.bet
    @dealer.bet
    view_money(@dealer)
    view_money(@player)
    view_dealer_cards
    view_player_cards
  end

  def view_dealer_cards
    @dealer.hand.view_stars
  end

  def view_player_cards
    @player.hand.view_hand
  end

  def view_money(person)
    puts "Счет игрока #{person.name}: #{person.money}"
  end

  def give_cards(n, person)
    (1..n).each do |_i|
      card = @deck.cards[rand(@deck.cards.size)]
      person.hand.add_card(card)
      @deck.del_card(card)
    end
  end

  def player_hand
    puts "Ваши карты, #{@player.name}"
    @player.hand.view_hand
  end

  def dealer_hand
    puts 'Карты крупье:'
    @dealer.hand.view_stars
  end

  def dealer_move
    puts "Ход диллера..."
    give_cards(1, @dealer) if @dealer.hand.points < 17
  end

  def open_cards
    puts 'Карты крупье:'
    @dealer.hand.view_hand
    @dealer.hand.view_points
    player_hand
    end_game
  end

  def end_game
    winner = find_winner
    case find_winner
    when 0
      puts 'Ничья!'
      @player.win_money(10)
      @dealer.win_money(10)
    else
      winner.win_money(20)
      puts "Победил: #{winner.name}!"
    end
    puts "Деньги крупье: #{@dealer.money}\nДеньги #{@player.name}:#{@player.money}"
  end

  def find_winner
    if @player.hand.points > @dealer.hand.points && @player.hand.points <= 21 || @dealer.hand.points > 21 && @player.hand.points <= 21
      @player
    elsif @player.hand.points == @dealer.hand.points || @player.hand.points > 21 && @dealer.hand.points > 21
      0
    else
      @dealer
    end
  end

  def three_cards?
    @player.hand.hand.size == 3 && @dealer.hand.hand.size == 3
  end
end
