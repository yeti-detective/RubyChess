class Piece
  attr_reader :symbol, :color
  def initialize(color, board, pos)
    @color = color
    @board = board
    @symbol = nil
    @pos = pos
  end

  def move_dirs
    []
  end

  def update_pos(pos)
    @pos = pos
  end

  # private
  attr_reader :pos, :board
  # def to_s
  # end
end
