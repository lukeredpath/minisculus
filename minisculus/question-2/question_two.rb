require 'shift_cypher'

module Minisculus
  module QuestionTwo
    def self.answer!
      MarkII.new(9, 3).decrypt('The Desert Fox will move 30 tanks to Calais at dawn')
    end
    
    class MarkII < ShiftCypher
      def initialize(first_key, second_key, character_set = default_character_set)
        super([Wheel.new(first_key), Wheel.new(second_key*2, true)], character_set)
      end
    end
  end
end
