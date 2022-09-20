require_relative 'board.rb'

class Game

    attr_accessor :board, :turn, :player1, :player2, :active

    def initialize
        @board = Board.new()
        @player1 = 'red'
        @player2 = 'blue'
        @active = @player1
        @last_move = [[]]
    end

    def play_turn()
        value = get_move
        r, c = @board.get_position(value)
        @board.change_grid(value, @active)
        @last_move = [[r,c], @active]
        change_player
    end

    def change_player
        if @active == @player1 
            @active = @player2
        else 
            @active = @player1
        end
    end

    def get_move
        value = nil
        while value == nil || (value < 1 || value > 7)
            puts "#{@active} choose a valid space (1-7) to put your piece"
            value = gets.chomp.to_i
        end
        return value
    end

    def play_game
        while !@board.BOARD_FULL? && !@board.GAME_WIN?(@last_move[0], @last_move[1])
            @board.print_board
            play_turn
        end
        @board.print_board
        if @board.GAME_WIN?(@last_move[0], @last_move[1])
            puts "#{@last_move[1]} wins!"
        else
            puts "The board is full.  It's a draw!"
        end
        if play_again?
            initialize
            play_game
        else
            puts "Goodbye"
            return
        end

    end

    def play_again?
        value = nil
        while value == nil || (value != 'y' && value != 'n')
            puts "Would you like to play again? (Y/N)"
            value = gets.chomp.downcase
        end
        if value == 'y'
            return true
        else
            return false
        end
    end

end

