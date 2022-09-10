require_relative 'board.rb'

class Game

    attr_accessor :board, :turn, :player1, :player2

    def initialize
        @board = Board.new()
        @turn = 1
        @player1 = 'red'
        @player2 = 'blue'
    end

    

end
