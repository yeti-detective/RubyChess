require_relative 'piece'
class Queen < Piece
  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = "\u2655 "
  end

  def move_dirs
    ['diagonal', 'horizontal']
  end

end
