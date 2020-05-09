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
    gets.chomp
  end

  def ask_player_decision
    puts 'Введите 1 чтобы взять карту'
    puts 'Введите 2 чтобы пропустить ход'
    puts 'Введите любое значение чтобы выйти'
    case gets.chomp.to_i
    when 1 then :take_card
    when 2 then :pass
    else 0
    end
  end

  def continue?
    puts "Сыграть еще одну раздачу?(1 - да, любой текст - нет)"
    gets.chomp.to_i == 1
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

  def dealer_msg
    puts "Ход диллера"
  end

  def print_winner(winner)
    puts "Ничья" if winner == 0
    puts "Победил #{winner.name}!" unless winner == 0
  end

  def view_bankrot(bankrot)
    puts "Игрок #{bankrot.name} банкрот!"
  end

  def new_game?
    puts "Начать новую игру? (1-да, любой другой текст - нет)"
    gets.chomp.to_i == 1
  end

  def continue?
    puts 'Продолжить игру? (0 - нет, 1 - да)'
    gets.chomp.to_i == 1
  end
end
