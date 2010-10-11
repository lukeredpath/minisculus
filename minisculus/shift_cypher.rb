module Minisculus
  class ShiftCypher
    attr_reader :previous_character_index
    
    def initialize(wheels, character_set)
      @wheels, @character_set = wheels, character_set
      @wheels.each { |wheel| wheel.cypher = self }
    end
    
    def decrypt(string)
      string.each_char.map { |char| transpose(char) }.join
    end
    
    private
    
    def transpose(char)
      @wheels.inject(char) { |char, wheel| wheel.transpose(char, @character_set) }.tap do |char|
        @previous_character_index = @character_set.index(char)
      end
    end
    
    class Wheel
      attr_accessor :cypher
      
      def initialize(key, reverse = false)
        @key, @reverse = key, reverse
      end
      
      def transpose(char, character_set)
        index = character_set.index(char) + adjusted_key
        index = (index % character_set.length) unless @reverse
        character_set[index]
      end
      
      protected
      
      def adjusted_key
        @reverse ? -@key : @key
      end
    end
    
    class DynamicWheel < Wheel
      DEFAULT_INDEX = 0
      
      def initialize(&modifier)
        @modifier = modifier
      end
      
      protected
      
      def adjusted_key
        @modifier.call(cypher.previous_character_index || DEFAULT_INDEX)
      end
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
