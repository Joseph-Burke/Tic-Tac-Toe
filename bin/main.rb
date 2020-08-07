require_relative '../lib/game'
require_relative '../lib/players'

game = Game.new



puts game.introduce
#Assign player names
puts game.request_name("Player 1")
game.add_player(gets.chomp.capitalize)
puts game.request_name("Player 2")
game.add_player(gets.chomp.capitalize)

puts game.players[0].name