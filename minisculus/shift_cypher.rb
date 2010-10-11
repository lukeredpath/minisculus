module Minisculus
  class ShiftCypher
    def initialize(wheels, character_set = default_character_set)
      @wheels, @character_set = wheels, character_set
    end
    
    def decrypt(string)
      string.each_char.map { |char| transpose(char) }.join
    end
    
    private
    
    def transpose(char)
      @wheels.inject(char) { |char, wheel| wheel.transpose(char, @character_set) }
    end
    
    def default_character_set
      [
        "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
        "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
        "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
        "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
        ".", ",", "?", "!", "'", "\"", " "
      ]
    end
    
    class Wheel
      def initialize(key, reverse = false)
        @key, @reverse = key, reverse
      end
      
      def transpose(char, character_set)
        index = character_set.index(char) + adjusted_key
        index -= character_set.length unless @reverse
        character_set[index]
      end
      
      private
      
      def adjusted_key
        @reverse ? -@key : @key
      end
    end
  end
end
