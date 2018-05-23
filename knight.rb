require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
  include Stepable

  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = "\u2658 "
  end

  def move_diffs
    [
      [2, 1],
      [2, -1],
      [1, -2],
      [-1, -2],
      [-2, -1],
      [-2, 1],
      [-1, 2],
      [1, 2]
    ]
  end


end
