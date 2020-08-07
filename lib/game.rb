require_relative 'board'

class Game
    attr_accessor :board, :players

    def initialize 
        @board = Board.new
        @players = []
    end

    def introduce
        "\nWelcome to Tic-Tac-Toe!\n\n"
    end

    def request_name(n)
        "#{n}, enter your name:" 
    end

    def add_player(name)
        players.push(Player.new(name)) 
    end
end