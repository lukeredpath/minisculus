module Minisculus
  module QuestionOne
    class MarkI
      def initialize(key, character_set = default_character_set)
        @key, @character_set = key, character_set
      end
      
      def decrypt(chars)
        chars.each_char.map { |char| transpose(char) }.join
      end
      
      private
      
      def transpose(char)
        index = @character_set.index(char) + @key
        @character_set[index - @character_set.length]
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
    end
  end
end

if __FILE__ == $0
end
