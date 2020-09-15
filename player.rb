class Player
  attr_accessor :lives, :turn
  attr_reader :name

  def initialize(name)
    @name = name
    @current_lives = 3
    @turn = false
  end

end