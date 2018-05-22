require_relative 'piece'

class Rook < Piece
  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = "\u2656 "
  end

  def move_dirs
    []
  end

end
