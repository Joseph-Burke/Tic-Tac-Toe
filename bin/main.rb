#!/usr/bin/env ruby


# Introduce game
puts "\nWelcome to Tic-Tac-Toe!"

#Ask for player name.
puts "Player 1 enter your name:"
player_1_name = gets.chomp.capitalize

puts "Player 2 enter your name:"
player_2_name = gets.chomp.capitalize


# Assign O's to one player and X's to the other.
puts "#{player_1_name}, choose your symbol. X or O?\n\n"

input = gets.chomp.upcase

possible_symbols = ['X', 'O']

while !possible_symbols.include?(input)
    puts "Invalid symbol. Choose again. X or O?\n\n"
    input = gets.chomp.upcase
end

player_1_symbol = input
possible_symbols.delete(player_1_symbol)
player_2_symbol = possible_symbols[0]

puts "\n#{player_1_name}, your symbol is #{player_1_symbol}."
puts "\n#{player_2_name}, your symbol is #{player_2_symbol}.\n\n"

# LOOP
game_active = true
    # O's go first. Allow that player to select an available square.
    first_player = (player_1_symbol == 'O' ? "#{player_1_name}" : "#{player_2_name}")
    second_player = (player_1_symbol == 'X' ? "#{player_1_name}" : "#{player_2_name}")


    puts "O goes first. That's you, #{first_player}.\n"
    puts "\n\tGAME BOARD\n\n"
    puts "Choose a square by entering a number from 1 to 9."
    gets.chomp

    counter = 0
    # X's go next. Allow that player to select an available square.
    while game_active
        puts "\nYour turn, #{second_player}."
        puts "\n\tGAME BOARD\n\n"
        puts "Choose a square by entering a number from 1 to 9."
        gets.chomp

        puts "\nYour turn, #{first_player}."
        puts "\n\tGAME BOARD\n\n"
        puts "Choose a square by entering a number from 1 to 9."
        gets.chomp

        counter += 1

        game_active = false if counter >= 4
    end

# Announce which player is victorious.
victorious_player = rand(2) == 1 ? first_player : second_player

puts "\n#{victorious_player} wins! Well played!\n"

# Allow the players to play again.

puts "Hit R to replay."
puts "Hit S to switch symbols and replay." 
puts "Hit Q to quit.\n\n"

input = gets.chomp.upcase