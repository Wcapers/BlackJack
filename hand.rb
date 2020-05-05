require './deck.rb'
class Hand
  attr_accessor :hand
  attr_accessor :points
  def initialize
    @hand = []
    @points = 0
  end

  def add_card(card)
    @hand << card
    add_points(card)
  end

  def view_hand
    @hand.each do |card|
      print " |#{card.rank}#{card.suit}|"
    end
    print "\n"
    view_point
  end

  def view_stars
    @hand.each { |i| print "|*|"}
    print "\n"
  end

  private

  def view_point
    puts "Points: #{@points}"
  end


  def add_points (card)
      if card.rank == 'A' && @points + 11 > 21
        @points += 1
      else
        @points += card.value
      end
  end
end
