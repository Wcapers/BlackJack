require './card.rb'
require './deck.rb'
require './hand.rb'
require './player.rb'
require './game.rb'
class Interface
  attr_accessor :qame
  def initialize
    @bank = 0
    puts "Добро пожаловать!\n Введите свое имя:"
    @game = Game.new(gets.chomp)
  end

  def start
    @game.first_move
    loop do
      puts "Введите 1 для пропуска хода"
      puts "Введите 2 для чтобы взять карту"
      puts "Введите 3 для чтобы открыть карты"
      input = gets.chomp.to_i
      case input
      when 1 then @game.dealer_move
      when 2 then @game.give_cards(1, @game.player)
      when 3 then @game.give_cards(1, @game.player)
        if @game.three_cards
    end
  end
end

Interface.new.start
