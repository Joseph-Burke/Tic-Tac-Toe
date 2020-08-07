require_relative 'tile'

class Board
    attr_accessor :board_tiles, :board_strings
    def initialize
        @board_strings = []
        @board_tiles = []
        construct_board_tiles
        construct_board
    end

    def construct_board_tiles
        (1..9).each {|i| board_tiles.push(Tile.new(i))}
    end

    # We have 3 tiles
    # We want 5 long strings to print out to the terminal


    # PRODUCES THE TOP STRING FOR THE WHOLE ROW OF TILES
        # Go into the first tile, get the top string.
        # Add a divider "|"
        # Go into the second tile, get the top string.
        # Add a divider "|"
        # Go into the third tile, get the top string.

    # DO THE SAME FOR THE NEXT FOUR


    def construct_row(array_of_tiles)
        5.times do |i| 
            string = array_of_tiles[0].tile_strings[i] + "|" + array_of_tiles[1].tile_strings[i] + "|" + array_of_tiles[2].tile_strings[i]
            self.board_strings.push(string)
        end
    end

    def construct_division
        self.board_strings.push(" ________|_________|________ ")
    end

    def construct_board
        self.board_strings = []
        construct_row(board_tiles[0..2])
        construct_division
        construct_row(board_tiles[3..5])
        construct_division
        construct_row(board_tiles[6..8])
    end

    def display
        board_strings
    end
end

board = Board.new

puts board.display
