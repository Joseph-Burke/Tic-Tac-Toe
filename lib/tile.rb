class Tile

    attr_accessor :tile_state, :tile_strings

    def initialize(id)
        @id = id
        @tile_state = nil
        construct_tile_strings
    end

    def construct_tile_strings
        @tile_strings = Tile::TILE_STRINGS_HASH[tile_state]
    end

    def change_state(new_state)
        if tile_state == nil
            self.tile_state = new_state
            construct_tile_strings
        end
    end

    TILE_STRINGS_HASH = {
        "X" => [
            "         ",
            "   \\  /  ",
            "    \\/   ",
            "    /\\   ",
            "   /  \\  ",
        ],
        "O" => [
            "    __   ",
            "   /  \\  ",
            "  /    \\ ",
            "  \\    / ",
            "   \\__/  "
        ],
        nil => [
            "         ",
            "         ",
            "         ",
            "         ",
            "         ",
        ]
    }
end

# test_tile = Tile.new(1)

# puts test_tile.tile_strings

# test_tile.change_state("O")

# puts test_tile.tile_strings