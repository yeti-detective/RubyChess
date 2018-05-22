require_relative 'piece'

class NullPiece < Piece
  def initialize(pos)
    @pos = pos
    @color = NullPiece.get_color(pos)
    @symbol = "\u25A3 "
  end

  private
  def self.get_color(pos)
    case NullPiece.both_odd_even(pos[0], pos[1])
    when true
      return :black
    else
      return :white
    end
  end

  def self.both_odd_even(n1, n2)
    return true if (n1.odd? && n2.odd?) || (n1.even? && n2.even?)
    false
  end
end
