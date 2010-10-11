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

describe "Mark III machine" do
  it "should not change a single character string as the third wheel defaults to zero" do
    Minisculus::QuestionThree::MarkIV(0, 0, %w{a b c d e}).decrypt("c").should == "c"
    Minisculus::QuestionThree::MarkIV(1, 0, %w{a b c d e}).decrypt("c").should == "d"
    Minisculus::QuestionThree::MarkIV(1, 1, %w{a b c d e}).decrypt("c").should == "b"
  end
  
  it "should change the second character of a string based on the tranposed first string" do
    Minisculus::QuestionThree::MarkIV(0, 0, %w{a b c d e}).decrypt("cc").should == "cb"
    Minisculus::QuestionThree::MarkIV(2, 0, %w{a b c d e}).decrypt("cc").should == "ec"
  end
end
