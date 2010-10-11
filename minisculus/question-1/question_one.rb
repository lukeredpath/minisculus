require 'shift_cypher'

module Minisculus
  module QuestionOne
    def self.answer!
      MarkI.new(6).decrypt('Strong NE Winds!')
    end
    
    class MarkI < ShiftCypher
      def initialize(key, character_set = default_character_set)
        super([Wheel.new(key)], character_set)
      end
    end
  end
end
