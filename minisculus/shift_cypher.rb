module Minisculus
  class ShiftCypher
    attr_reader :last_character
    
    def initialize(wheels, character_set)
      @wheels, @character_set = wheels, character_set.to_character_set
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
      attr_reader :key
      
      def initialize(key, reverse = false)
        @key = reverse ? -key : key
      end
      
      def encrypt(char, character_set)
        index = character_set.index(char) + key
        character_set[index]
      end
      
      def decrypt(char, character_set)
        index = character_set.index(char) - key
        character_set[index]
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

      def key
        @modifier.call(self.previous_character_index || DEFAULT_INDEX)
      end
    end
  end
end
