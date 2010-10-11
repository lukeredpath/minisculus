require 'shift_cypher'

module Minisculus
  module QuestionThree
    def self.answer!

    end
    
    def self.MarkIV(wheel_one, wheel_two, character_set = DEFAULT_CHARSET)
      ShiftCypher.new([
        ShiftCypher::Wheel.new(wheel_one), 
        ShiftCypher::Wheel.new(wheel_two * 2, true),
        ShiftCypher::DynamicWheel.new { |idx| idx * 2 }
      ], character_set)
    end
  end
end
