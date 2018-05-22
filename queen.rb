require_relative 'piece'
require_relative 'slidable'

class Queen < Piece
  include Slidable

  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = "\u2655 "
  end

  def move_dirs
    ['diagonal', 'horizontal']
  end

end
