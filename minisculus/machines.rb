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
end
