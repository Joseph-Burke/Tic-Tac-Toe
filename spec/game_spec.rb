require 'game'
require 'players'

describe Game do
  describe '#introduction' do
    it 'returns a string that introduces the game' do
      game = Game.new
      expect(game.introduce).to eql("\nWelcome to Tic-Tac-Toe!\n")
    end
  end

  describe '#request_name' do
    it "returns a string that requests a player's name" do
      game = Game.new
      expect(game.request_name('Player')).to eql("\nPlayer, enter your name:\n")
    end
  end

  describe '#add_player' do
    it "pushes a new Player object to the Game object's @players attribute" do
      game = Game.new
      game.add_player('Joe')
      expect(game.players[0].is_a?(Player)).to eql(true)
      expect(game.players[0].name).to eql('Joe')
    end
  end

  describe '#request_symbol' do
    it "returns a string that requests a player's symbol" do
      game = Game.new
      player = Player.new('Bill')
      expect(game.request_symbol(player)).to eql("\nBill, choose a symbol. X or O?\n")
    end
  end

  describe '#announce_symbols' do
    it "returns a string that announces both players' symbols" do
      game = Game.new
      %w[Bill Josh].each { |e| game.players.push(Player.new(e)) }
      %w[X O].each_with_index { |e, i| game.players[i].symbol = e }
      expect(game.announce_symbols).to eql("\nBill is X's.\nJosh is O's.\n\n")
    end
  end

  describe '#announce_first_turn' do
    it "returns a string that announces which player goes first" do
      game = Game.new
      %w[Bill Josh].each { |e| game.players.push(Player.new(e)) }
      %w[X O].each_with_index { |e, i| game.players[i].symbol = e }
      expect(game.announce_first_turn).to eql("\nO's go first. That's you, Bill!\n\n")
    end
  end

  describe '#place_symbol' do
    it "changes the state of one of the game-board's tiles" do
      game = Game.new
      game.place_symbol(1, 'X')
      expect(game.board.board_tiles[0].tile_state).to eql('X')
    end
  end

  describe '#announce_turn' do
    it "returns a string that announces which player's turn it is" do
      game = Game.new
      player = Player.new('Bill')
      player.symbol = 'X'
      expect(game.announce_turn(player)).to eql("\nYour turn, Bill! Enter a number from 1 to 9 to place your 'X'.\n")
    end
  end

  describe '#victory_check' do
    it "returns a player's symbol when they've won" do
      game = Game.new
      game.available_tiles = ['O', 'O', 'O', 4, 5, 6, 7, 8, 9]
      expect(game.victory_check).to eql('O')
    end

    it 'returns a false value when neither player has won' do
      game = Game.new
      game.available_tiles = ['O', 'X', 'O', 4, 5, 6, 7, 8, 9]
      expect(game.victory_check).to eql(false)
    end
  end

  describe '#announce_victory' do
    it "returns a string that announces the winner" do
      game = Game.new
      %w[Bill Josh].each { |e| game.players.push(Player.new(e)) }
      %w[X O].each_with_index { |e, i| game.players[i].symbol = e }
      expect(game.announce_victory('X')).to eql("\n'X' wins! Well played, Bill!\n\n")
    end
  end
end
