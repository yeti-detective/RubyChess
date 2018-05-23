module Slideable
  CROSS_DIRECTIONS = [
    [-1, 0],
    [0, 1],
    [1, 0],
    [0, -1]
  ].freeze

  X_DIRECTIONS = [
    [-1, -1],
    [-1, 1],
    [1, 1],
    [1, -1]
  ].freeze

  def horizontal_dirs
    CROSS_DIRECTIONS
  end

  def diagonal_dirs
    X_DIRECTIONS
  end

  def moves
    moves = []
    move_dirs.each do |dx, dy|
      moves.concat(how_far_can_you_go(dx, dy))
    end
    moves
  end

  def how_far_can_you_go(dx, dy)
    x, y = pos
    moves = []
    loop do
      x, y = x + dx, y + dy
      pos = [x, y]

      if board.valid_pos?(pos)
        moves << pos unless moves.include?(pos)
      elsif board.take_piece?(pos, self.color)
        moves << pos unless moves.include?(pos)
        break
      else
        break
      end
    end
    moves.uniq
  end
end
