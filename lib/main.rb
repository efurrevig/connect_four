require_relative 'board.rb'
require_relative 'game.rb'

game = Game.new
game.board.create_board
game.board.change_grid(7, 'red')
game.board.change_grid(7, 'red')
game.board.change_grid(6, 'red')
game.board.change_grid(6, 'red')
game.board.change_grid(5, 'red')
game.board.change_grid(5, 'red')
game.board.change_grid(5, 'red')
game.board.change_grid(4, 'red')
game.board.change_grid(4, 'red')
game.board.change_grid(4, 'red')
game.board.GAME_WIN?(4, 'red')
game.board.print_board