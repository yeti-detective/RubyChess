require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
  include Slideable
  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = "\u2657 "
  end

  def move_dirs
    []
  end

end
