class Card
  attr_accessor :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def value
    case @rank
      when 2..9 then @rank
      when /J|Q|K/ then 10
      when 'A' then 11
    end
  end

  def view
    puts "#{rank}^#{suit}"
  end
end

class Deck
  attr_accessor :cards
  @ranks = [ 2, 3, 4, 5, 6, 7, 8, 9, 'J', 'Q', 'K', 'A' ]
  @suits = [ "\u{2660}", "\u{2663}", "\u{2665}", "\u{2666}" ]

  def initialize
    @cards = []
    @ranks.each do |rank|
      @suits.each do |suit|
        @cards << Card.new(suit, rank)
      end
    end
    @cards.shuffle!
  end
end
