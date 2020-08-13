require 'tile'

describe Tile do
  describe '#change_state' do
    it "changes a Tile object's tile_state attribute" do
      tile = Tile.new(1)
      tile.change_state('X')
      expect(tile.tile_state).to eql('X')
    end

    it "reconstructs the Tile object's @tile_strings attribute according to its new tile_state" do
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

  describe '#construct_tile_strings' do
    it "gives a Tile object an array of strings stored in the Class constant" do
      tile = Tile.new(1)
      tile.tile_state = 'O'
      tile.construct_tile_strings
      expect(tile.tile_strings).to eql([
                                         '    __   ',
                                         '   /  \\  ',
                                         '  /    \\ ',
                                         '  \\    / ',
                                         '   \\__/  '
                                       ])
    end
  end
end
