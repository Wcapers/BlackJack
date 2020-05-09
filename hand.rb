# frozen_string_literal: true

class Hand
  attr_accessor :points, :cards

  def initialize
    @cards = []
    @points = 0
  end

  def add_card(card)
    @cards << card
    add_points(card)
  end

  def clean
    @cards = []
    @points = 0
  end

  private

  def add_points(card)
    @points += if card.rank == 'A' && @points + 11 > 21
                 1
               else
                 card.value
               end
  end
end
