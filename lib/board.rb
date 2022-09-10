class Board
    attr_accessor :grid
    attr_reader :grid, :empty, :red, :blue

    def initialize
        @grid = []
        @empty = "\u273a"
        @red = "\e[31m#{"\u273a"}\e[0m"
        @blue = "\e[34m#{"\u273a"}\e[0m"
    end

    #creates an m x n matrix of n numbers 1 to (m*n)
    def create_board(m = 6, n = 7)
        x = 1
        m.times do
            @grid << (x...(x+n)).to_a
            x += n
        end
    end

    #prints white circle if open, red/blue if occupied by a piece
    def print_board
        for i in 0...@grid.length
            puts "\n"
            for k in 0...@grid[i].length
                if grid[i][k].is_a?(Integer)
                    print " #{empty} "
                elsif grid[i][k] == 'red'
                    print " #{@red} "
                elsif grid[i][k] == 'blue'
                    print " #{@blue} "
                end
            end
            puts "\n"
        end
        puts " 1  2  3  4  5  6  7 "
    end

    #returns [x, y] array,  grid[x][y] == value
    def get_position(value)
        @grid.each_with_index do |i, index|
            temp = i.find_index(value)
            if !temp.nil?
                return [index, temp]
            end
        end
    end

    # def change_grid(value, player)
    #     position = get_position(value)
    #     @grid[position[0]][position[1]] = player
    # end

    #takes value 1 to 7 && player, changes first int found in that row to player color
    def change_grid(value, player)
        x = 5
        while x >= 0
            if @grid[x][value-1].is_a?(Integer)
                @grid[x][value-1] = player
                return
            end
            x -= 1
        end
    end

    #returns true if there are no integers left in board (all moves have been made)
    def BOARD_FULL?
        @grid.each do |i|
            if !i.all? {|x| x.is_a?(String)}
                return false
            end
        end
        return true
    end

end
# board = Board.new
# board.create_grid
# board.change_grid(6, 'red')
# board.change_grid(6, 'red')
# board.change_grid(6, 'red')
# board.print_board
# board.player_input(6, 'red')
# board.print_board

# U+25EF  - large circle
# 