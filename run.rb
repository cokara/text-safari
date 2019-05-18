require_relative 'number_dictionary'
require_relative 'turn'
require_relative 'move'
require_relative 'hadithi'

actions = [
  Turn.new(:right),
  Move.new(5),
  Turn.new(:left),
  Move.new(1)
]

puts Hadithi.new(actions).call
