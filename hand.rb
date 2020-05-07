# frozen_string_literal: true

class Hand
  attr_accessor :points, :hand

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
    view_points
  end

  def view_stars
    @hand.each { |_i| print ' |**|' }
    print "\n"
  end

  def view_points
    puts "Points: #{@points}"
  end

  def clean
    @hand = []
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
