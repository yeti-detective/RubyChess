require 'colorize'
require_relative 'board'
require_relative 'cursor'

require 'byebug'

class Display
  attr_reader :board, :cursor
  def initialize(cursor, board)
    @board = board
    @cursor = cursor
  end
  def render
    system('clear')
    board.grid.each do |row|
      row.each do |square|
        if square.pos == cursor.cursor_pos
          print square.symbol.colorize(:yellow)
        else
          print square.symbol.colorize(square.color)
        end
      end
      puts
    end
  end
end

board = Board.new
cursor = Cursor.new([4,4], board)
display = Display.new(cursor, board)

display.render
puts "not quite playable, gimme second"
sleep(3)
while true
  display.render
  cursor.get_input
end
