require_relative 'board'

class Game
    attr_accessor :board, :players, :turn_counter, :available_tiles

    def initialize 
        @board = Board.new
        @players = []
        @turn_counter = 0
        @available_tiles = [1, 2, 3, 4, 5, 6, 7, 8, 9]
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

    def place_symbol(num, symbol)
        available_tiles.map! {|e| e == num ? symbol : e }
        board.board_tiles[num - 1].change_state(symbol)
        board.construct_board
    end

    def announce_turn(player)
        "Your turn, #{player.name}! Enter a number from 1 to 9 to place your '#{player.symbol}'."
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