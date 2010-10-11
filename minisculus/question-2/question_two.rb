require 'shift_cypher'

module Minisculus
  module QuestionTwo
    def self.answer!
      MarkII(9, 3).encrypt('The Desert Fox will move 30 tanks to Calais at dawn')
    end
    
    def self.MarkII(wheel_one, wheel_two, character_set = DEFAULT_CHARSET)
      ShiftCypher.new([
        ShiftCypher::Wheel.new(wheel_one), 
        ShiftCypher::Wheel.new(wheel_two * 2, true)
      ], character_set)
    end
  end
end
