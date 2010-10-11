require 'shift_cypher'
require 'question-4/question_four'

module Minisculus
  module QuestionFour
    def self.answer!
      QuestionThree.MarkIV(7, 2).decrypt(%q{WZyDsL3u'0TfxP06RtSSF 'DbzhdyFIAu2 zF f5KE"SOQTNA8A"NCKPOKG5D9GSQE'M86IGFMKE6'K4pEVPK!bv83I})
    end
  end
end

