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
  def initialize(blank = false)
    @sentinel = NullPiece.new([10, 10])
    if blank
      @grid = Array.new(8) do |row|
        Array.new(8) do |col|
          NullPiece.new([row, col])
        end
      end
    else
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
    return in_bounds?(pos) unless in_bounds?(pos)
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
      raise RangeError.new("Cannot move to this position")
    end
    self[end_pos] = self[start_pos]
    self[end_pos].update_pos(end_pos)
    self[start_pos] = NullPiece.new(start_pos)
  end

  def in_bounds?(pos)
    return false if pos.nil?
    row, col = pos
    return false unless row.between?(0, 7) && col.between?(0, 7)
    true
  end

  def valid_pos?(pos)
    return false unless in_bounds?(pos)
    return true if self[pos].class == NullPiece
    false
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def own_team?(color, pos)
    !@grid[pos].is_a?(NullPiece) && color == @grid[pos].color
  end

  def take_piece?(pos, color)
    return false unless in_bounds?(pos)
    return true if self[pos].class != NullPiece && self[pos].color != color
    false
  end

  def safe_move?(color, pos)
    gonna_getcha = []
    grid.each do |row|
      row.each do |square|
        unless square.is_a?(NullPiece) && square.color == color
          gonna_getcha.concat(square.move_dirs)
        end
      end
    end
    !gonna_getcha.include?(pos)
  end

  def in_check?(color)
    king_pos = find_king(color)
    grid.each do |row|
      row.each do |square|
        if square.color != color && square.class != NullPiece
          return true if square.moves.include?(king_pos)
        end
      end
    end
    false
  end

  def find_king(color)
    grid.each do |row|
      row.each do |square|
        if square.is_a?(King) && square.color == color
          return square.pos
        end
      end
    end
  end

  def highlight_moves(moves)
    grid.each_with_index do |row, r_idx|
      row.each_with_index do |square, c_idx|
        if moves.include?([r_idx, c_idx])
          square.color = :red
        end
      end
    end
  end

  def pieces
  end

  def dup
    dup_board = Board.blank_board
    grid.each do |row|
      row.map do |square|
        if square.is_a?(NullPiece)
          NullPiece.new(square.pos)
        else
          piece = square.class.new(square.color, dup_board, square.pos)
          dup_board.add_piece(piece, piece.pos)
        end
      end
    end
    dup_board
  end

  def self.blank_board
    return Board.new(true)
  end

end
