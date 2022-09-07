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
    end

    def change_grid(value, player)
        position = get_position(value)
        @grid[position[0]][position[1]] = player
    end

    def BOARD_FULL?
        @grid.each do |i|
            if !i.all? {|x| x.is_a?(String)}
                return false
            end
        end
        return true
    end

end
board = Board.new
board.create_board(4,4)
                x = 1
                16.times do
                    board.change_grid(x, 'red')
                    x += 1
                end
puts "#{board.BOARD_FULL?}"
puts "#{board.grid}"
