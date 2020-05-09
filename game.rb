require './round.rb'
require './interface.rb'

class Game
  def initialize
    @round = Round.new(Interface.welcome)
    @player = @round.player
    @dealer = @round.dealer
    @turn = 0
  end

  def start
    until @round.bankrot?
      new_turn
      @turn = 0
      until @round.end_round?(@turn)
        @turn += 1
        player_decision(Interface.ask_player_decision , @turn)
        @round.dealer_move
      end
      winner = @round.find_winner
      Interface.print_winner(winner)
      Interface.view_hand(@dealer)
      Interface.view_hand(@player)
      @round.end_round(winner)
      next if Interface.continue?
      exit
    end
    Interface.view_bankrot(@round.who_bankrot)
    new_game if Interface.new_game?
  end

  def new_game
    initialize
    start
  end

  def new_turn
    @round.first_move
    Interface.view_money(@dealer)
    Interface.view_money(@player)
    Interface.overview(@player,@dealer)
  end

  def player_decision (decision, turn)
    case decision
    when :take_card then @round.give_cards(1, @player)
    when :pass then Interface.dealer_msg
    else exit
    end
  end
end
