class Player
  attr_reader :symbol
  attr_accessor :name, :order
  def initialize(name)
    @name = name
    @symbol = nil
    @order = nil
  end

  def take_opposite_symbol_to(other_player)
    case other_player.symbol
    when 'O'
      self.symbol = 'X'
    when 'X'
      self.symbol = 'O'
    end
  end

  def symbol=(arg)
    @symbol = arg
    @order = 1 if @symbol == 'O'
    @order = 2 if @symbol == 'X'
  end
end
