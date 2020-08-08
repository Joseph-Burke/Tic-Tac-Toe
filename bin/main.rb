#!/usr/bin/env ruby

board = [
  '         |         |         ',
  '         |         |         ',
  '         |         |         ',
  '         |         |         ',
  '         |         |         ',
  '_________|_________|_________',
  '         |         |         ',
  '         |         |         ',
  '         |         |         ',
  '         |         |         ',
  '         |         |         ',
  '_________|_________|_________',
  '         |         |         ',
  '         |         |         ',
  '         |         |         ',
  '         |         |         ',
  '         |         |         '
]

def empty_line(num = 1)
  puts "\n" * num
end

empty_line
puts 'Welcome to Tic-Tac-Toe!'
empty_line(2)

puts 'Player 1, enter your name: '
player_1_name = gets.chomp.capitalize
empty_line
puts 'Player 2, enter your name: '
player_2_name = gets.chomp.capitalize

player_1_symbol = nil

while player_1_symbol.nil?
  empty_line
  puts "#{player_1_name}, choose a symbol. X or O?"
  empty_line

  input = gets.chomp.strip.upcase
  if %w[X O].include?(input)
    player_1_symbol = input
  else
    puts 'Invalid entry!'
  end
end

player_2_symbol = (player_1_symbol == 'X' ? 'O' : 'X')

empty_line
puts [
  "#{player_1_name} is #{player_1_symbol}.",
  "#{player_2_name} is #{player_2_symbol}."
]
empty_line

puts board

turn_counter = 0
players = [player_1_name, player_2_name]
available_tiles = [1, 2, 3, 4, 5, 6, 7, 8, 9]

while turn_counter < 9
  current_player = players[turn_counter % 2]
  input = nil

  until (1..9).include?(input) && available_tiles.include?(input)
    empty_line
    puts "It's your turn, #{current_player}. Enter a number between 1 and 9 to place your symbol on an empty tile."
    empty_line
    print 'The following tiles are available: '
    available_tiles.each { |e| print " #{e} " }
    empty_line(2)
    input = gets.chomp.to_i

    unless (1..9).include?(input)
      empty_line
      puts 'Invalid input! Enter a number between 1 and 9.'
      next
    end

    puts "\nInvalid input! That tile has already been taken." unless available_tiles.include?(input)
  end

  available_tiles.delete(input)

  puts board
  empty_line

  turn_counter += 1
end

winner = players[rand(0..1)]
puts "#{winner} wins! Well played!"
empty_line
