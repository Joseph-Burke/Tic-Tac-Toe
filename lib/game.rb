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

    def request_symbol(player)
        "#{player.name}, choose a symbol. X or O?"
    end

    def announce_symbols
        "\n#{player_one.name} is #{player_one.symbol}'s.\n#{player_two.name} is #{player_two.symbol}'s.\n\n"
    end

    def announce_first_turn
        "O's go first. That's you, #{players[0].name}!"
    end

    # Aliases for the players
    def player_one
        @players[0]
    end

    def player_one=(arg)
        @players[0] = arg
    end

    def player_two
        @players[1]
    end

    def player_two=(arg)
        @players[1] = arg
    end
end