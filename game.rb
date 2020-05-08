require './round.rb'
require './interface.rb'
class Game
  def initialize
    round = Round.new(Interface.welcome)
    @player = round.player
    @dealer = round.dealer
  end

  def start
    until round.bankrot?
      round.first_move
      Interface.view_money(@dealer)
      Interface.view_money(@dealer)
      Interface.overview(@player,@dealer)
    end
  end
end
