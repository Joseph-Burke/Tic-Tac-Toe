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
end