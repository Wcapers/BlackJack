class Player
  attr_accessor :money, :hand
  attr_reader :name
  def initialize (hand, name)
    @hand = hand
    @money = 100
    @name = name
  end

  def bet
    @money -= 10
  end

  def win_money
    @money += 20
  end

end
