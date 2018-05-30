class Game
  attr_reader :display, :cursor, :board

  def initialize(display)
    @display = display
    @board = display.board
    @cursor = display.cursor
    @pos = display.cursor.cursor_pos
  end

  def play
    until game_over
      display.render
      temp_pos = cursor.get_input
      if temp_pos.is_a?(Array)
        @pos = temp_pos
      elsif temp_pos && !board[@pos].is_a?(NullPiece)
        selected_piece(board[@pos])
      end
    end

  end

  def selected_piece(piece)
    fake_board = board.dup
    fake_cursor = cursor.class.new(cursor.cursor_pos, fake_board)
    fake_display = display.class.new(cursor, fake_board)
    fake_board[piece.pos].select
    fake_display.render
    moved = false
    selection = {}
    until moved
      next_moves = piece.moves.concat([piece.pos]).sort
      selection = fake_display.cursor.cycle_moves(next_moves, fake_display)
      moved = selection[:finished]
    end
    if selection[:pos] != @pos
      board.move_piece(piece.pos, selection[:pos])
    end
  end

  def game_over
    false
  end

end
