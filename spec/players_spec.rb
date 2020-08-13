require 'players'

describe Player do
    describe '#take_opposite_symbol_to' do
        it "assigns to a player the opposite symbol to another player's" do
            player_1 = Player.new('Bill')
            player_2 = Player.new('John')
            player_2.symbol = 'X'
            player_1.take_opposite_symbol_to(player_2)
            expect(player_1.symbol).to eql('O')
        end
    end
end

