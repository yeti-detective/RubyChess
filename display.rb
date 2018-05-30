require 'colorize'

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
