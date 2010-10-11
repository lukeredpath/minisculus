require 'spec_helper'
require 'question-3/question_three'

describe "DynamicWheel" do
  it "should transpose based on the previously transposed character's index" do
    wheel = Minisculus::ShiftCypher::DynamicWheel.new { |idx| idx + 1 }
    wheel.cypher = stub('cypher', :previous_character_index => 1)
    wheel.transpose("a", %w{a b c}).should == "c"
    wheel.cypher = stub('cypher', :previous_character_index => 0)
    wheel.transpose("a", %w{a b c}).should == "b"
  end
end

describe "Mark IV machine" do
  it "should not change a single character string as the third wheel defaults to zero" do
    Minisculus::QuestionThree::MarkIV(0, 0, %w{a b c d e}).encrypt("c").should == "c"
    Minisculus::QuestionThree::MarkIV(1, 0, %w{a b c d e}).encrypt("c").should == "d"
    Minisculus::QuestionThree::MarkIV(1, 1, %w{a b c d e}).encrypt("c").should == "b"
    Minisculus::QuestionThree::MarkIV(1, 2, %w{a b c d e}).encrypt("b").should == "d"
  end
  
  it "should change the second character of a string based on the position of the first char" do
    Minisculus::QuestionThree::MarkIV(0, 0, %w{a b c d e}).encrypt("bc").should == "be"
    Minisculus::QuestionThree::MarkIV(1, 2, %w{a b c d e}).encrypt("bc").should == "db"
  end
  
  it "should change the third character of a string based on the position of the second char" do
    Minisculus::QuestionThree::MarkIV(0, 0, %w{a b c d e}).encrypt("bca").should == "bee"
    Minisculus::QuestionThree::MarkIV(1, 2, %w{a b c d e}).encrypt("bcd").should == "dbe"
  end
end
