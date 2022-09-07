class Board
    attr_accessor :grid
    attr_reader :grid
    def initialize
        @grid = []
    end

    def create_board(m, n)
        x = 1
        m.times do
            @grid << (x...(x+n)).to_a
            x += n
        end
    end

end

# board = Board.new
# board.create_board(6,7)
# puts "#{board.grid}"