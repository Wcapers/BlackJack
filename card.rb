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
    print @rank, @suit
  end
end
