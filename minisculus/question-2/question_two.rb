require 'question-1/question_one'

module Minisculus
  module QuestionTwo
    def self.answer!
      MarkII.new(9, 3).decrypt('The Desert Fox will move 30 tanks to Calais at dawn')
    end
    
    class MarkII < QuestionOne::MarkI
      def initialize(first_key, second_key, character_set = default_character_set)
        super(first_key, character_set)
        @second_key = second_key
      end
      
      def transpose(char)
        index = @character_set.index(super(char)) - (2 * @second_key)
        @character_set[index]
      end
    end
  end
end