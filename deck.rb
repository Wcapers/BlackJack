# frozen_string_literal: true

require './card.rb'
class Deck
  attr_accessor :cards
  @@ranks = [2, 3, 4, 5, 6, 7, 8, 9, 'J', 'Q', 'K', 'A']
  @@suits = ["\u{2660}", "\u{2663}", "\u{2665}", "\u{2666}"]

  def initialize
    @cards = []
    @@ranks.each do |rank|
      @@suits.each do |suit|
        @cards << Card.new(suit, rank)
      end
    end
    @cards.shuffle!
  end

  def del_card(card)
    @cards.delete(card)
  end
end
