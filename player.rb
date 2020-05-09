# frozen_string_literal: true

class Player
  attr_reader :name, :money, :hand

  def initialize(hand, name)
    @hand = hand
    @money = 100
    @name = name
  end

  def bet
    @money -= 10
  end

  def win_money(n)
    @money += n
  end
end
