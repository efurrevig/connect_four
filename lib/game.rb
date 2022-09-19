require_relative 'board.rb'

class Game

    attr_accessor :board, :turn, :player1, :player2, :active

    def initialize
        @board = Board.new()
        @player1 = 'red'
        @player2 = 'blue'
        @active = nil
    end

    def play_turn()
        if @active == nil
            @active = @player1
        end
        value = nil
        while value == nil || (value < 1 || value > 7)
            puts "#{@active} choose a valid space (1-7) to put your piece"
            value = gets.chomp.to_i
        end
        @board.change_grid(value, @active)
        if @active == @player1 
            @active = @player2
        else 
            @active = @player1
        end
    end

    def play_game
        while !@board.BOARD_FULL?
            @board.print_board
            play_turn
        end
    end
    

end

