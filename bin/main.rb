require_relative '../lib/game'
require_relative '../lib/players'

game = Game.new



puts game.introduce
#Assign player names
# puts game.request_name("Player 1")
# game.add_player(gets.chomp.capitalize)
# puts game.request_name("Player 2")
# game.add_player(gets.chomp.capitalize)


game.add_player("Joe")
game.add_player("Kalu")


while game.player_one.symbol.nil?
    puts game.request_symbol(game.player_one)
    input = gets.chomp.strip.upcase
    if input == 'X' || input == 'O'
        game.player_one.symbol = input
    else
        puts 'Invalid entry!'
    end
end

puts game.player_one.symbol