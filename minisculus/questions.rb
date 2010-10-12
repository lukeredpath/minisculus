$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))

require 'machines'

module Minisculus
  module Questions    
    module One
      def self.id
        "14f7ca5f6ff1a5afb9032aa5e533ad95"
      end
      
      def self.answer
        Minisculus::Machines.MarkI(6).encrypt('Strong NE Winds!')
      end
    end
    
    module Two
      def self.id
        "2077f244def8a70e5ea758bd8352fcd8"
      end
      
      def self.answer
        Minisculus::Machines.MarkII(9, 3).encrypt('The Desert Fox will move 30 tanks to Calais at dawn')
      end
    end
    
    module Three
      def self.id
        "36d80eb0c50b49a509b49f2424e8c805"
      end
      
      def self.answer
        Minisculus::Machines.MarkIV(4, 7).encrypt('The white cliffs of Alghero are visible at night')
      end
    end
    
    module Four
      def self.id
        "4baecf8ca3f98dc13eeecbac263cd3ed"
      end
      
      def self.answer
        puts "Decrypted: #{Minisculus::Machines.MarkIV(7, 2).decrypt(%q{WZyDsL3u'0TfxP06RtSSF 'DbzhdyFIAu2 zF f5KE"SOQTNA8A"NCKPOKG5D9GSQE'M86IGFMKE6'K4pEVPK!bv83I})}"
        Minisculus::Machines.MarkIV(7, 2).decrypt(%q{WZyDsL3u'0TfxP06RtSSF 'DbzhdyFIAu2 zF f5KE"SOQTNA8A"NCKPOKG5D9GSQE'M86IGFMKE6'K4pEVPK!bv83I})
      end
    end
  end
end
