module Minisculus
  class ShiftCypher
    attr_reader :last_character
    
    def initialize(wheels, character_set)
      @wheels, @character_set = wheels, character_set
      @wheels.each { |wheel| wheel.cypher = self }
    end
    
    def encrypt(string)
      string.each_char.map { |char| transpose(char, :encrypt) }.join
    end
    
    def decrypt(encrypted_string)
      encrypted_string.each_char.map { |char| transpose(char, :decrypt) }.join
    end
    
    private
    
    def transpose(character, method)
      @last_character = character
      
      @wheels.inject(character) do |char, wheel|
        wheel.send(method, char, @character_set)
      end
    end
    
    class Wheel
      attr_accessor :cypher
      
      def initialize(key, reverse = false)
        @key, @reverse = key, reverse
      end
      
      def encrypt(char, character_set)
        index = character_set.index(char) + adjusted_key
        index = (index % character_set.length) unless @reverse
        character_set[index]
      end
      
      def decrypt(char, character_set)
        index = character_set.index(char) - adjusted_key
        index = (index % character_set.length) if @reverse
        character_set[index]
      end
      
      protected
      
      def adjusted_key
        @reverse ? -@key : @key
      end
    end
    
    class LastPositionWheel < Wheel
      DEFAULT_INDEX = 0
      
      attr_accessor :previous_character_index
      
      def initialize(&modifier)
        @modifier = modifier || proc{ |key| key }
      end
      
      def encrypt(char, character_set)
        super.tap do |encrypted|
          self.previous_character_index = character_set.index(cypher.last_character)
        end
      end
      
      def decrypt(char, character_set)
        super.tap do |decrypted|
          self.previous_character_index = character_set.index(decrypted)
        end
      end
      
      protected
      
      def adjusted_key
        @modifier.call(self.previous_character_index || DEFAULT_INDEX)
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
