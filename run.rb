require_relative 'number_dictionary'
require_relative 'turn'
require_relative 'move'
require_relative 'hadithi'

actions = [
  Turn.new(:right),
  Move.new(5),
  Turn.new(:left),
  Move.new(1),
  Turn.new(:left),
  Move.new(7),
  Turn.new(:right),
  Move.new(2)
]

puts
puts
puts "____ Hadithi!! Hadithi!! ____"
puts
puts Hadithi.new(actions).call
puts
puts "~~~[ Kwaheri ]~~~"
puts

