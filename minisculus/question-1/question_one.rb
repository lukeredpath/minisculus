require 'shift_cypher'

module Minisculus
  module QuestionOne
    def self.answer!
      MarkI(6).decrypt('Strong NE Winds!')
    end
    
    def self.MarkI(wheel_one, character_set = DEFAULT_CHARSET)
      ShiftCypher.new([
        ShiftCypher::Wheel.new(wheel_one), 
      ], character_set)
    end
  end
end
