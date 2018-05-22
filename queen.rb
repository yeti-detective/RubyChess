require_relative 'piece'
class Queen < Piece
  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = "\u2655 "
  end
end
