class Hand
  attr_accessor :hand
  attr_accessor :points
  def initialize
    @hand = []
    @points = 0
  end

  def add_card(card)
    @hand << card
    add_points (card)
  end
private
  def add_points (card)
      if card.rank == 'A' && @points + 11 > 21
        @points += 1
      else
        @points += card.value
      end
  end
end
