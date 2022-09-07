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

    def get_position(value)
        @grid.each_with_index do |i, index|
            temp = i.find_index(value)
            if !temp.nil?
                return [index, temp]
            end
        end
        return ''
    end

    def change_grid(value, player)
        position = get_position(value)
        @grid[position[0]][position[1]] = player
    end

    def BOARD_FULL?
        return @grid.any?(Integer)
    end

end

board = Board.new
board.create_board(6,7)
puts "#{board.grid}"
