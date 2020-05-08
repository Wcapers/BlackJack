# frozen_string_literal: true

require './card.rb'
require './deck.rb'
require './hand.rb'
require './player.rb'
require './game.rb'
module Interface
  module_function

  def welcome
    puts 'Добро пожаловать!'
    puts 'Введите свое имя:'
    gets.chomp.to_i
  end

  def ask_player_decision
    puts 'Введите 1 чтобы взять карту'
    puts 'Введите 2 чтобы пропустить ход'
    puts 'Введите 3 чтобы открыть карты'
    puts 'Введите любое значение чтобы выйти'
    case gets.chomp.to_i
    when 1 then :take_card
    when 2 || 3 then :pass
    else 0
    end
  end

  def view_hand(person)
    puts "Карты #{person.name}"
    person.hand.cards.each do |card|
      print " |#{card.rank}#{card.suit}|"
    end
    print "\n"
    view_points(person)
  end

  def view_points(person)
    puts "Points: #{person.hand.points}"
  end

  def dealer_hand(person)
    puts 'Карты крупье:'
    person.hand.cards.each { |_i| print ' |**|' }
    print "\n"
  end

  def view_money(person)
    puts "Счет игрока #{person.name}: #{person.money}"
  end

  def overview(player, dealer)
    dealer_hand(dealer)
    view_hand(player)
    view_points(player)
  end
  
  def start
    bankrot_menu if bankrot?
    @game.first_move
    turn = 0
    loop do
      turn += 1
      puts "Ход №#{turn}"
      puts 'Введите 0 чтобы выйти'
      puts 'Введите 1 чтобы взять карту'
      puts 'Введите 2 чтобы пропустить ход'
      puts 'Введите 3 чтобы открыть карты'
      puts 'Введите 4 чтобы начать новую игру'
      case gets.chomp.to_i
      when 0
        puts 'До встречи!'
        exit
      when 1
        @game.give_cards(1, @game.player)
      when 2
        puts 'Пропуск хода...'
      when 3
        if turn == 1
          puts 'Вы не можете открыть карты на первом ходу'
          turn = 0
          next
        end
      when 4
        new_game
      else
        raise 'Неизвестное значение'
      end
      @game.dealer_move
      @game.view_dealer_cards
      @game.view_player_cards
      next unless @game.three_cards? || turn == 2

      @game.open_cards
      exit unless continue?
      start
    end
  end

  def continue?
    puts 'Продолжить игру? (0 - нет, 1 - да)'
    gets.chomp.to_i == 1
  end

  def bankrot?
    @game.player.money.zero? || @game.dealer.money.zero?
  end

  def who_bankrot
    @game.player.name if @game.player.money.zero?
    @game.dealer.name if @game.dealer.money.zero?
  end


  def new_game
    initialize
    start
  end

  def bankrot_menu
    puts "У игрока #{who_bankrot} закончились деньги!"
    puts '1 - начать новую игру, 2 - выход'
    case chomp.gets.to_i
    when 1 then new_game
    when 2 then exit
    else
      raise 'Неизвестное значение'
    end
  end
end
