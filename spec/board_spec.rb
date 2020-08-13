require 'board'

describe Board do
    describe '#construct_board_tiles' do
        it "Pushes 9 tiles to the Board object's @board_tiles array" do
            board = Board.new ; board.board_tiles = []
            board.construct_board_tiles
            expect(board.board_tiles.length).to eql(9)
            expect(board.board_tiles.all?(Tile)).to eql(true)
        end
    end

    describe '#construct_row' do
        it "pushes 5 strings to the @board_strings array" do
            board = Board.new ; board.board_strings = []
            tiles = [] ; 3.times {|i| tiles.push(Tile.new(i))}
            board.construct_row(tiles)
            expect(board.board_strings.length).to eql(5)
            expect(board.board_strings.all?(String)).to eql(true)
        end
    end

    describe '#construct_division' do
        it "pushes 1 string to the @board_strings array" do
            board = Board.new ; board.board_strings = []
            board.construct_division
            expect(board.board_strings).to eql([' ________|_________|________ '])
        end
    end

    describe '#construct_board' do
        it "empties the @board_strings array and then pushes 17 strings to it" do
            board = Board.new ; board.board_strings = [1, 2, 3, 4, 'Jack', false]
            board.construct_board
            expect(board.board_strings.all?(String)).to eql(true)
            expect(board.board_strings.length).to eql(17)
        end
    end
end