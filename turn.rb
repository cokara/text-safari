class Turn
  attr_reader :direction

  def initialize(direction)
    @direction = direction
  end

  def to_s
    'turn'
  end

  def magnitude
    direction
  end
end
