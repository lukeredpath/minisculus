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
        Minisculus::Machines.MarkIV(7, 2).decrypt(%q{WZyDsL3u'0TfxP06RtSSF 'DbzhdyFIAu2 zF f5KE"SOQTNA8A"NCKPOKG5D9GSQE'M86IGFMKE6'K4pEVPK!bv83I})
      end
    end
    
    module Five
      def self.id
        "50763edaa9d9bd2a9516280e9044d885"
      end
      
      def self.answer
        code = "QT4e8MJYVhkls.27BL9,.MSqYSi'IUpAJKWg9Ul9p4o8oUoGy'ITd4d0AJVsLQp4kKJB2rz4dxfahwUa\"Wa.MS!k4hs2yY3k8ymnla.MOTxJ6wBM7sC0srXmyAAMl9t\"Wk4hs2yYTtH0vwUZp4a\"WhB2u,o6.!8Zt\"Wf,,eh5tk8WXv9UoM99w2Vr4!.xqA,5MSpWl9p4kJ2oUg'6evkEiQhC'd5d4k0qA'24nEqhtAQmy37il9p4o8vdoVr!xWSkEDn?,iZpw24kF\"fhGJZMI8nkI"
        keywords = %w{FURLIN BUNKER}
        wheel_range = (0..9)
        acceptable_wheel_positions = []
        message = nil
        wheel_range.each do |wheel_one|
          wheel_range.each do |wheel_two|
            result = Minisculus::Machines.MarkIV(wheel_one, wheel_two).decrypt(code)
            if keywords.all? { |keyword| result =~ /#{keyword}/ }
              puts "Found result for wheel positions {#{wheel_one}, #{wheel_two}}."
              acceptable_wheel_positions << [wheel_one, wheel_two]
              message = result
            end
          end
        end
        if message
          puts "Message: #{message}"
          puts "Wheel Positions: #{acceptable_wheel_positions.inspect}"
        else
          puts "Could not find the result! :("
        end
      end
    end
  end
end
