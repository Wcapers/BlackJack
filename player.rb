class Player
  attr_accessor :money :hand
  def initialize (hand)
    @hand = hand
    @money = 100
  end

  def bet (value)
    @money -= value
  end
end
