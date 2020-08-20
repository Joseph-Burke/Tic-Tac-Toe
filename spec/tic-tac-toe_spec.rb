require_relative '../lib/game.rb'
require_relative '../lib/players.rb'
require_relative '../lib/tile.rb'
require_relative '../lib/board.rb'

describe Game do
  describe '#introduce' do
    it 'returns a string to welcome the players to the game' do
      game = Game.new
      expect(game.introduce).to eql("\nWelcome to Tic-Tac-Toe!\n")
    end
  end

  describe '#request_name' do
    it "returns a string that requests the name of players" do
      game = Game.new
      expect(game.request_name('Player')).to eql("\nPlayer, enter your name:\n")
    end
  end

  describe '#add_player' do
    it "pushes a new Player object to the Game object's @players attribute" do
      game = Game.new
      game.add_player('Ahmad')
      expect(game.players[0].name).to eql('Ahmad')
      expect(game.players[0].is_a?(Player)).to eql(true)
    end
  end

  describe '#request_symbol' do
    it "returns a string for the player to choose a symbol" do
      game = Game.new
      player = Player.new('Kalu')
      expect(game.request_symbol(player)).to eql("\nKalu, choose a symbol. X or O?\n")
    end
  end

  describe '#announce_symbols' do
    it "returns a string that show players names and symbols" do
      game = Game.new
      %w[Ahmad Kalu].each { |x| game.players.push(Player.new(x)) }
      %w[X O].each_with_index { |x, y| game.players[y].symbol = x }
      expect(game.announce_symbols).to eql("\nAhmad is X's.\nKalu is O's.\n\n")
    end
  end

  describe '#announce_first_turn' do
    it 'returns a string that shows which player should play first' do
      game = Game.new
      %w[Ahmad Kalu].each { |x| game.players.push(Player.new(x)) }
      %w[X O].each_with_index { |x, y| game.players[y].symbol = x }
      expect(game.announce_first_turn).to eql("\nO's go first. That's you, Ahmad!\n\n")
    end
  end

  describe '#place_symbol' do
    it "changes the tiles in the game-board" do
      game = Game.new
      game.place_symbol(1, 'O')
      expect(game.board.board_tiles[0].tile_state).to eql('O')
    end
  end

  describe '#announce_turn' do
    it "returns a string to tell player to make a selection" do
      game = Game.new
      player = Player.new('Ahmad')
      player.symbol = 'O'
      expect(game.announce_turn(player)).to eql("\nYour turn, Ahmad! Enter a number from 1 to 9 to place your 'O'.\n")
    end
  end

  describe '#take_opposite_symbol_to' do
    it "Gives the opposite symbol to the player if a particular symbol is taken" do
      player1 = Player.new('Ahmad')
      player2 = Player.new('Kalu')
      player2.symbol = 'O'
      player1.take_opposite_symbol_to(player2)
      expect(player1.symbol).to eql('X')
    end 
  end

  describe '#victory_check' do
    context "To Check winner" do
      it "returns the symbol of player that won" do
        game = Game.new
        game.available_tiles = [1, 2, 3, 'X', 'X', 'X', 7, 8, 9]
        expect(game.victory_check).to eql('X')
      end
      it 'returns a false when no player has won' do
        game = Game.new
        game.available_tiles = [1, 2, 3, 'X', 'O', 'X', 7, 8, 9]
        expect(game.victory_check).to eql(false)
      end

      describe '#announce_victory' do
        it 'returns a string to announce the winner of the game' do
          game = Game.new
          %w[Ahmad Kalu].each { |x| game.players.push(Player.new(x)) }
          %w[X O].each_with_index { |x, y| game.players[y].symbol = x }
          expect(game.announce_victory('X')).to eql("\n'X' wins! Well played, Ahmad!\n\n")
        end
      end
    end
  end

  describe '#change_state' do
    context 'Changes Tile state' do
      it "changes a Tile object's tile_state attribute" do
        tile = Tile.new(1)
        tile.change_state('X')
        expect(tile.tile_state).to eql('X')
      end

      it "changes 'X' to the new tile_state" do
        tile = Tile.new(1)
        tile.change_state('X')
        expect(tile.tile_strings).to eql([
                                         '         ',
                                         '   \\  /  ',
                                         '    \\/   ',
                                         '    /\\   ',
                                         '   /  \\  '
                                       ])
      end
    end
  end
end