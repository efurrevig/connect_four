require './lib/game.rb'

describe Game do
    subject(:game) {described_class.new}

    describe '#initialize' do
        it 'is turn 1' do 
            expect(game.turn).to eql(1)
        end

        it 'player1 is nil' do
            expect(game.player1).to eql(nil)
        end

        it 'player2 is nil' do
            expect(game.player2).to eql(nil)
        end
    end

end