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

    def victory_check
        o_wins = %w[O O O]
        x_wins = %w[X X X]

        Game::VICTORY_COMBINATIONS.each do |comb|
            arr = []
            comb.each { |num| arr.push(available_tiles[num - 1])}
            return 'O' if arr == o_wins
            return 'X' if arr == x_wins
        end
        false
    end

    def announce_victory(symbol)
        arr = self.players.filter {|player| player.symbol == symbol}
        winner = arr[0]
        return "'#{symbol}' wins! Well played, #{winner.name}!"
    end

    def announce_draw
        return "Draw!"
    end

    def offer_rematch
        [
            "\n",
            "Enter R to play again.",
            "Enter S to switch symbols and play again.",
            "Enter Q to quit.",
            "\n"
        ]
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

    VICTORY_COMBINATIONS = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7]
    ]
end