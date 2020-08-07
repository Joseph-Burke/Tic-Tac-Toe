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
    return unless tile_state.nil?

    self.tile_state = new_state
    construct_tile_strings
  end

  TILE_STRINGS_HASH = {
    'X' => [
      '         ',
      '   \\  /  ',
      '    \\/   ',
      '    /\\   ',
      '   /  \\  '
    ],
    'O' => [
      '    __   ',
      '   /  \\  ',
      '  /    \\ ',
      '  \\    / ',
      '   \\__/  '
    ],
    nil => [
      '         ',
      '         ',
      '         ',
      '         ',
      '         '
    ]
  }.freeze
end
