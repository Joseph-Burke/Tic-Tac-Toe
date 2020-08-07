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

game.player_two.take_opposite_symbol_to(game.player_one)

puts game.announce_symbols

game.players.sort_by! { |player| player.order }

puts game.board.display

puts game.announce_first_turn


while game.turn_counter < 9 
    current_player = game.players[game.turn_counter % 2]
    input = nil

    until (1..9).include?(input) && game.available_tiles.include?(input)
        puts game.announce_turn(current_player)
        input = gets.chomp.to_i

        unless (1..9).include?(input)
            puts "Invalid input! Enter a number between 1 and 9."
            next
        end

        unless game.available_tiles.include?(input)
            puts "Invalid input! That tile has already been taken."
        end

    end

    game.place_symbol(input, current_player.symbol)

    puts game.board.display

    game.turn_counter += 1
end