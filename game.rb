# arr[rand(arr.size)] random arr value
class Game
attr_accessor :deck, :player, :dealer
  def initialize (player_name)
    @deck = Deck.new
    @player = Player.new(hand.new, player_name)
    @dealer = Player.new(hand.new, dealer)
  end
  def start
    loop do

    end
  end

  def first_move
    give cards(2, @dealer)
    give cards(2, @player)
    @player.bet
    @dealer.bet
    @dealer.hand.view_stars
    @player.hand.view_hand
  end

  def give_cards(n, person)
    for i in 1..n
      card = @deck.cards[rand(cards.size)]
      person.hand.add_card(card)
      @deck.del_card(card)
    end
  end
end
