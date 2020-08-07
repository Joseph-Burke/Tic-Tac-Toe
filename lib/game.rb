require_relative 'board'

class Game
    attr_accessor :board

    def initialize 
        @board = Board.new
    end

    def introduce
        "\nWelcome to Tic-Tac-Toe!\n\n"
    end
end