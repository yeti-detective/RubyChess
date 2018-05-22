require_relative 'piece'
require_relative 'stepable'

class King < Piece
  # include Stepable
  MOVE_DIFFS = [
    [1,-1],
    [1, 0],
    [1, 1],
    [0, 1],
    [-1, 1],
    [-1, 0],
    [-1,-1],
    [0, -1]
  ]

  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = "\u2654 "
  end

  def move_dirs

  end

  def potential_moves
    moves = MOVE_DIFFS.map do |diff|
      [
        diff[0] + pos[0],
        diff[1] + pos[1]
      ]
    end
    moves.select { |move| board.valid_pos?(move) && board[move].is_a?(NullPiece) }
  end

  # protected


end
