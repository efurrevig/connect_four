require './lib/board.rb'

describe Board do

    subject(:board) {described_class.new}

    describe '#initialize' do
        it 'is an empty array' do
            expect(board.grid).to eql([])
        end
    end

    describe '#create_board' do
        it 'returns a matrix of length n and width m' do
            n = 4
            m = 4
            expected_array = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
            board.create_board(m,n)
            expect(board.grid).to eql(expected_array)
        end
    end
    
    describe '#get_position' do
        it 'returns if value is 1' do
            board.create_board(4,4)
            expect(board.get_position(1)).to eql([0,0])
        end
    end

    describe '#change_grid' do
        context 'player is red and value is 1' do
            it 'returns position [0][0] as "red"' do
                board.create_board(4,4)
                board.change_grid(1, 'red')
                expect(board.grid[0][0]).to eql('red')
            end
        end
    end

    describe '#BOARD_FULL?' do
        context 'board is full' do
            it 'returns true' do

            end
        end
        context 'board is not full' do
            it 'returns false' do
                board.create_board(4,4)
                expect(board).to not_be_BOARD_FULL?
            end
        end
    end




end