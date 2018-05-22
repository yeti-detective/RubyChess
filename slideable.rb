module Slideable
  CROSS_DIRECTIONS = [
    [-1, 0],
    [0, 1],
    [-1, 0],
    [0, -1]
  ].freeze

  X_DIRECTIONS = [
    [-1, -1],
    [-1, 1],
    [1, 1],
    [1, -1]
  ]

  def horizontal_dirs
    CROSS_DIRECTIONS
  end

  def diagonal_dirs
    X_DIRECTIONS
  end

  def moves
    moves = []
    move_dirs.each do |dx, dy|

    end
  end

  def how_far_can_you_go(dx, dy)
    x, y = pos
    moves = []
    loop do
      x, y = x + dx, y + dy
      pos = [x, y]

      if board.valid_pos?(pos, @color)
        moves << pos
      else

    end
  end
end
