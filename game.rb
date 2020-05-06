# arr[rand(arr.size)] random arr value
class Game
  attr_accessor :deck, :player, :dealer

  def initialize (player_name)
    @deck = Deck.new
    @player = Player.new(Hand.new, player_name)
    @dealer = Player.new(Hand.new, 'Dealer')
  end

  def first_move
    give_cards(2, @dealer)
    give_cards(2, @player)
    @player.bet
    @dealer.bet
    view_money(@dealer)
    @dealer.hand.view_stars
    @player.hand.view_hand
    view_money(@player)
  end

 def view_money(person)
  puts "Счет игрока #{person.name}: #{person.money}"
 end

  def give_cards(n, person)
    for i in 1..n
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
    puts "Карты крупье:"
    @dealer.hand.view_stars
  end

  def dealer_move
    give_cards(1, @dealer) if @dealer.hand.points < 17
  end

  def open_cards
    puts "Карты крупье:"
    @dealer.hand.view_hand
    @dealer.hand.view_points
    player_hand
    print_winner_stats
  end


  def end_game
    winner = find__winner
    case find_winner
    when 0
      puts "Ничья!"
      @player.win_money(10)
      @dealer.win_money(10)
    else
      winner.win_money
      puts "Победил: #{winner.name}!"
      end
      puts "Деньги крупье: #{@dealer.money}\nДеньги #{@player.name}:#{@player.money}"
    end
  end

  def find_winner
    if @player.hand.points > @dealer.hand.points && @player.hand.points <= 21 || @dealer.hand.points > 21 && @player.hand.points <= 21
      @player
    elsif @player.hand.points == @dealer.hand.points || @player.hand.points > 21 && @dealer.hand.points > 21
      0
    else
      @dealer
  end

  def three_cards?
    @player.hand.size == 3 && @dealer.hand.size == 3
  end
end
