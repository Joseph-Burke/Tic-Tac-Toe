#!/usr/bin/env ruby

require_relative '../lib/game'
require_relative '../lib/players'

game = Game.new

puts game.introduce

puts game.request_name('Player 1')
game.add_player(gets.chomp.capitalize)

puts game.request_name('Player 2')
game.add_player(gets.chomp.capitalize)

while game.player_one.symbol.nil?
  puts game.request_symbol(game.player_one)
  input = gets.chomp.strip.upcase
  if %w[X O].include?(input)
    game.player_one.symbol = input
  else
    puts "\nInvalid entry!\n"
  end
end

game.player_two.take_opposite_symbol_to(game.player_one)

puts game.announce_symbols

game.players.sort_by!(&:order)

puts game.board.display
puts
puts game.announce_first_turn

puts game.board.display_guide

while game.turn_counter < 9 && !game.victory_check
  current_player = game.players[game.turn_counter % 2]
  input = nil

  until (1..9).include?(input) && game.available_tiles.include?(input)
    puts game.announce_turn(current_player)
    input = gets.chomp.to_i

    unless (1..9).include?(input)
      puts "\nInvalid input! That's not a number between 1 and 9.\n"
      next
    end

    puts "\nInvalid input! That tile has already been taken.\n" unless game.available_tiles.include?(input)
  end

  game.place_symbol(input, current_player.symbol)

  puts game.board.display

  puts game.announce_victory(game.victory_check) if game.victory_check

  game.turn_counter += 1

  puts game.announce_draw if game.turn_counter >= 9
end
