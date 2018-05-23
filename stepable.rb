module Stepable
  def moves
    move_diffs.each_with_object([]) do |(dx, dy), moves|
      cur_x, cur_y = pos
      pos = [cur_x + dx, cur_y + dy]

      next unless board.valid_pos?(pos) || board.take_piece?(pos, color)

      if board[pos].class == NullPiece
        moves << pos
      elsif board[pos].color != color
        moves << pos
      end
    end
  end

  def move_diffs
    raise NotImplementedError
  end
end
