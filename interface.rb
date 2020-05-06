require './card.rb'
require './deck.rb'
require './hand.rb'
require './player.rb'
require './game.rb'
class Interface
  attr_accessor :qame
  def initialize
    @bank = 0
    puts "Введите свое имя:"
    @game = Game.new(gets.chomp)
    puts "Добро пожаловать, #{@game.player.name}!"
  end

  def start
    @game.first_move
    turn = 0
    loop do
      turn += 1
      puts "Ход №#{turn}"
      puts "Введите 1 чтобы взять карту"
      puts "Введите 2 чтобы пропустить ход"
      puts "Введите 3 чтобы открыть карты"
      case gets.chomp.to_i
      when 1
        @game.give_cards(1, @game.player)
      when 2
        puts "пропуск хода"
      when 3
        if turn == 1
          puts "Вы не можете открыть карты на первом ходу"
          turn = 0
          next
        else
          @game.end_game
          start if continue?
          break unless continue?
        end
      end
      @game.dealer_move
      @game.view_dealer_cards
      @game.view_player_cards
      if @game.three_cards?
        @game.end_game
      end
  end
  end

  def continue?
    puts "Продолжить игру? (0 - нет, 1 - да)"
    gets.chomp.to_i == 1
  end
end
Interface.new.start
