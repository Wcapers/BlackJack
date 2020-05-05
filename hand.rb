class Hand
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def add_card(card)
    @hand << card
  end

  def points
    points = 0
    @hand.each do |h|
      if h.rank == 'A' && points + 11 < 21
        points += 1
      else
        points += h.value
      end
    end
  end
end
