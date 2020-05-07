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
   if bankrot?
    @game.first_move
    turn = 0
    loop do
      turn += 1
      puts "Ход №#{turn}"
      puts "Введите 0 чтобы выйти"
      puts "Введите 1 чтобы взять карту"
      puts "Введите 2 чтобы пропустить ход"
      puts "Введите 3 чтобы открыть карты"
      case gets.chomp.to_i
      when 0
        "До встречи!"
        exit
      when 1
        @game.give_cards(1, @game.player)
      when 2
        puts "Пропуск хода..."
      when 3
        if turn == 1
          puts "Вы не можете открыть карты на первом ходу"
          turn = 0
          next
        end
      else
      rescue 'Неизвестное значение'
      end
      @game.dealer_move
      @game.view_dealer_cards
      @game.view_player_cards
      if @game.three_cards? || turn == 2
        @game.open_cards
        exit unless continue?
        start
      end
  end
  end

  def continue?
    puts "Продолжить игру? (0 - нет, 1 - да)"
    gets.chomp.to_i == 1
  end

  def bankrot?
    @game.player.money == 0 || @game.dealer.money == 0
  end

  def who_bankrot
    @game.player.name if @game.player.money == 0
    @game.dealer.name if @game.dealer.money == 0
  end

  def new_game
    initialize
    start
  end

  def bankrot_menu
    puts "У игрока #{who_bankrot} закончились деньги!"
    puts "1 - начать новую игру, 2 - выход"
    case chomp.gets.to_i
    when 1 then new_game
    when 2 then exit
    else
    rescue "Неизвестное значение"
    end
  end
end
