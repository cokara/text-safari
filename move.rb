class Move
  attr_reader :steps

  def initialize(steps)
    @steps = steps
  end

  def to_s
    'move'
  end

  def magnitude
    steps
  end
end
