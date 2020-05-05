require './card.rb'
require './deck.rb'
require './hand.rb'
require './player.rb'
=begin d = Deck.new
h = Hand.new
#d.cards[0].view
#d.cards[1].view
#d.cards[2].view
puts "points0: #{h.points}"
h.add_card(d.cards[0])
puts "points1: #{h.points}"
h.add_card(d.cards[1])
puts "points1: #{h.points}"
#h.add_card(d.cards[2])
puts "card 1: #{h.hand[0].rank} card 2:#{h.hand[1].rank}"
=end
d = Deck.new
h = Hand.new
h.add_card(d.cards[0])
h.add_card(d.cards[1])
h.view_hand
puts h.points
