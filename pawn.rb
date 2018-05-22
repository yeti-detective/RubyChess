require_relative 'piece'
class Pawn < Piece
  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = "\u2659 "
  end

  def move_dirs
    # if color == :black, can move + down rows else can move - up rows
    forward_steps.map { |step| [step + pos[0], pos[1]] } + side_attacks
  end

  def at_start_row?
    return true if color == :black && pos[0] == 1
    return true if color == :white && pos[0] == 6
    false
  end

  def forward_dir
    color == :black ? 1 : -1
  end

  def forward_steps
    if at_start_row?
      [forward_dir, forward_dir * 2]
    else
      [forward_dir]
    end
  end

  def side_attacks
    right_attack = [(pos[0] + forward_dir), (pos[1] + 1)]
    left_attack = [(pos[0] + forward_dir), (pos[1] - 1)]
    attacks = [right_attack, left_attack]
    attacks.select do |attack|
      board.valid_pos?(attack) && !board[attack].is_a?(NullPiece) &&
      self.color != board[attack].color
    end
  end

end
