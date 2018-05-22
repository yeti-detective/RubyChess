class Piece
  attr_reader :symbol, :color
  def initialize(color, board, pos)
    @color = color
    @board = board
    @symbol = nil
    @pos = pos
  end

  def moves
    moves = []
    if move_dirs.include?('diagonal')
      up_right = [@pos[0] + 1, @pos[1] + 1]
    end
  end

  def update_pos(pos)
    @pos = pos
  end

  # private
  attr_reader :pos, :board
  # def to_s
  # end
end
