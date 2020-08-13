require 'players'

describe Player do
  describe '#take_opposite_symbol_to' do
    it "assigns to a player the opposite symbol to another player's" do
      player1 = Player.new('Bill')
      player2 = Player.new('John')
      player2.symbol = 'X'
      player1.take_opposite_symbol_to(player_2)
      expect(player1.symbol).to eql('O')
    end
  end
end
