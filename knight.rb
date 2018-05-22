require_relative 'piece'
require_relative 'stepable'
class Knight < Piece
  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = "\u2658 "
  end

  include Stepable
  def moves
  end
  # 
  # def move_dirs
  #
  # end


end
