require './card.rb'
require './deck.rb'
require './hand.rb'
require './player.rb'

class Round
  attr_accessor :deck, :player, :dealer

  def initialize(player_name)
    @player = Player.new(Hand.new, player_name)
    @dealer = Player.new(Hand.new, 'Дилер')
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
  end

  def give_cards(n, person)
    (1..n).each do |_i|
      card = @deck.cards[rand(@deck.cards.size)]
      person.hand.add_card(card)
      @deck.del_card(card)
    end
  end

  def player_move(decision)
    case decision
    when :take_card
      give_cards(1, @player)
    when :pass
      dealer_move
    end
  end

  def dealer_move
    if @dealer.hand.points < 17 && @dealer.hand.cards.size < 3
      give_cards(1, @dealer)
    end
  end

  def find_winner
    if @player.hand.points > @dealer.hand.points && @player.hand.points <= 21 ||
        @dealer.hand.points > 21 && @player.hand.points <= 21
      @player
    elsif @player.hand.points == @dealer.hand.points || @player.hand.points > 21 &&
        @dealer.hand.points > 21
      0
    else
      @dealer
    end
  end

  def three_cards?
    @player.hand.cards.size == 3
  end

  def bankrot?
    @player.money.zero? || @dealer.money.zero?
  end

  def end_round?(turn)
    three_cards? || turn == 2
  end

  def end_round(winner)
    case find_winner
    when 0
      @player.win_money(10)
      @dealer.win_money(10)
    else
      winner.win_money(20)
    end
  end

  def who_bankrot
    return @player if @player.money.zero?
    return @dealer if @dealer.money.zero?
  end
end
