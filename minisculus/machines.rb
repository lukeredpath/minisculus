require 'shift_cypher'

module Minisculus
  module Machines
    def self.MarkI(wheel_one, character_set = Minisculus::DEFAULT_CHARSET)
      ShiftCypher.new([
        ShiftCypher::Wheel.new(wheel_one), 
      ], character_set)
    end
    
    def self.MarkII(wheel_one, wheel_two, character_set = Minisculus::DEFAULT_CHARSET)
      ShiftCypher.new([
        ShiftCypher::Wheel.new(wheel_one), 
        ShiftCypher::Wheel.new(wheel_two * 2, true)
      ], character_set)
    end
    
    def self.MarkIII
      raise "Not Implemented due to budget overruns!"
    end
    
    def self.MarkIV(wheel_one, wheel_two, character_set = Minisculus::DEFAULT_CHARSET)
      ShiftCypher.new([
        ShiftCypher::Wheel.new(wheel_one), 
        ShiftCypher::Wheel.new(wheel_two * 2, true),
        ShiftCypher::LastPositionWheel.new { |idx| idx * 2 }
      ], character_set)
    end
  end
  
  DEFAULT_CHARSET = [
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
    "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
    "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
    ".", ",", "?", "!", "'", "\"", " "
  ]
end
