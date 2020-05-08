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
    when take_card
      give_cards(1, @player)
    end
  end

  def dealer_move
    if @dealer.hand.points < 17 && @dealer.hand.hand.size < 3
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
    @player.hand.hand.size == 3
  end
end
