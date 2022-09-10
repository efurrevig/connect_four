require_relative 'board.rb'
require_relative 'game.rb'

game = Game.new
game.board.create_board
game.play_game