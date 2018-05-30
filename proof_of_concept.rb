require_relative 'board'
require_relative 'cursor'
require_relative 'display'
require_relative 'game'

board = Board.new
cursor = Cursor.new([4,4], board)
display = Display.new(cursor, board)
game = Game.new(display)

game.play
