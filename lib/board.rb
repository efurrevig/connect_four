class Board
    attr_accessor :grid
    attr_reader :grid, :empty, :red, :blue

    def initialize
        @grid = create_board
        @empty = "\u273a"
        @red = "\e[31m#{"\u273a"}\e[0m"
        @blue = "\e[34m#{"\u273a"}\e[0m"
    end

    #creates an m x n matrix of n numbers 1 to (m*n)
    def create_board(m = 6, n = 7)
        arr = []
        x = 1
        m.times do
            arr << (x...(x+n)).to_a
            x += n
        end
        return arr
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
    # def get_position(value)
    #     @grid.each_with_index do |i, index|
    #         temp = i.find_index(value)
    #         if !temp.nil?
    #             return [index, temp]
    #         end
    #     end
    # end

    def get_position(value)
        x = 5
        while x >= 0
            if @grid[x][value-1].is_a?(Integer)
                return [x, value-1]
            end
            x -= 1
        end
    end

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


    def GAME_WIN?(value, player)
        if value == nil || player == nil
            return false
        end
        # r, c = get_position(value) 
        # change_grid(value, player)
        
        if check_horizontal(value, player) == true || check_vertical(value, player) == true || check_vertical_left(value, player) == true || check_vertical_right(value, player) == true
            return true
        else
            return false
        end

    end

    def check_vertical(value, player)
        move = [1,0],[-1,0]
        r,c = value
        count = -1
        while @grid[r][c] == player
            count += 1
            if r+move[0][0] > 5 || r+move[0][0] < 0
                break
            end
            r += move[0][0]
        end
        r,c = value
        while @grid[r][c] == player
            count += 1
            if r+move[1][0] > 5 || r+move[1][0] < 0
                break
            end
            r += move[1][0]
        end
        if count >= 4
            return true
        else
            return false
        end
    end

    ###
    def check_horizontal(value, player)
        move = [[0,1],[0,-1]]
        r, c = value
        count = -1
        while @grid[r][c] == player
            count += 1
            if c+move[0][1] > 6 || c+move[0][1] < 0
                break
            end
            c += move[0][1]
        end
        r,c = value
        while @grid[r][c] == player
            count += 1
            if c+move[1][1] > 6 || c+move[1][1] < 0
                break
            end
            c += move[1][1]
        end
        if count >= 4
            return true
        else
            return false
        end
    end

    ###
    def check_vertical_left(value, player)
        move = [-1,-1],[1,1]
        r, c = value
        count = -1
        while @grid[r][c] == player
            count += 1
            if r+move[0][0] > 5 || r+move[0][0] < 0 ||c+move[0][1] > 6 || c+move[0][1] < 0
                break
            end
            c += move[0][1]
            r += move[0][0]
        end
        r, c = value
        while @grid[r][c] == player
            count += 1
            if r+move[1][0] > 5 || r+move[1][0] < 0 ||c+move[1][1] > 6 || c+move[1][1] < 0
                break
            end
            c += move[1][1]
            r += move[1][0]
        end
        if count >= 4
            return true
        else
            return false
        end
    end


    ### move = [1,0],[-1,0],[0,1],[0,-1],[1,1],[-1,-1],[1,-1],[-1,1]
    def check_vertical_right(value, player)
        move = [1,-1],[-1,1]
        r, c = value
        count = -1
        while @grid[r][c] == player
            count += 1
            if r+move[0][0] > 5 || r+move[0][0] < 0 ||c+move[0][1] > 6 || c+move[0][1] < 0
                break
            end
            c += move[0][1]
            r += move[0][0]
        end
        r, c = value
        while @grid[r][c] == player
            count += 1
            if r+move[1][0] > 5 || r+move[1][0] < 0 ||c+move[1][1] > 6 || c+move[1][1] < 0
                break
            end
            c += move[1][1]
            r += move[1][0]
        end
        if count >= 4
            return true
        else
            return false
        end
    end

end