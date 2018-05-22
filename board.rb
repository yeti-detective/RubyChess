require 'byebug'

require_relative 'null_piece.rb'
require_relative 'pawn'
require_relative 'rook'
require_relative 'bishop'
require_relative 'knight'
require_relative 'king'
require_relative 'queen'


class Board
  attr_reader :grid
  def initialize
    @sentinel = NullPiece.new([10, 10])
    @grid = Array.new(8) do |row|
      Array.new(8) do |col|
        case row
        when 1, 6
          color = row == 1 ? :black : :white
          Pawn.new(color, self, [row, col])
        when 0, 7
          back_row(row, col)
        else
          NullPiece.new([row, col])
        end
      end
    end
    # populate board with pieces in chess formation on initialize

  end

  def back_row(row, col)
    color = row == 0 ? :black : :white
    args = [color, self, [row, col]]
    case col
    when 0, 7
      Rook.new(*args)
    when 1, 6
      Knight.new(*args)
    when 2, 5
      Bishop.new(*args)
    when 3
      color == :black ? King.new(*args) : Queen.new(*args)
    when 4
      color == :white ? King.new(*args) : Queen.new(*args)
    end
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    grid[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].is_a?(NullPiece)
      raise TypeError.new("No piece at start position")
    end
    unless valid_pos?(end_pos)
      raise RangeError.new("End position is not on the board")
    end
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new(start_pos)
  end

  def valid_pos?(pos)
    row, col = pos
    row.between?(0, 7) && col.between?(0, 7)
  end

  def add_piece(piece, pos) # make private later
    self[pos] = piece
  end

  def checkmate?(color)
    # if color.king.valid_moves.empty?
  end

  def own_team?(color, pos)
    # not be a NullPiece &&
    !@grid[pos].is_a?(NullPiece) && color == @grid[pos].color
  end

  def safe_move?(color, pos)
    gonna_getcha = []
    grid.each do |row|
      row.each do |square|
        unless square.is_a?(NullPiece) && square.color == color
          # puts square.move_dirs
          gonna_getcha.concat(square.move_dirs)
        end
      end
    end
    !gonna_getcha.include?(pos)
  end

  def in_check?(color)
  end

  def find_king(color)
  end

  def pieces
  end

  def dup
  end

  def move_piece!(color, start_pos, end_pos)
  end

end
