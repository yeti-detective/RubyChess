class Game
  attr_reader :display

  def initialize(display)
    @display = display
  end

  def play
    until game_over
      display.render
      display.cursor.get_input
    end

  end

  def game_over
    false
  end

end
