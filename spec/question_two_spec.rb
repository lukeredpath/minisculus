require 'spec_helper'
require 'question-2/question_two'

describe "Mark II example with wheels set to 2 and 5" do
  it "should translate 'abc' to 'STU'" do
    Minisculus::QuestionTwo::MarkII.new(2, 5).decrypt('abc').should == 'STU'
  end
end

describe "Mark II" do
  context "with the second wheel set to zero" do
    it "should shift a character in a set by the given first wheel key when decrypting" do
      Minisculus::QuestionTwo::MarkII.new(1, 0, %w{a b c}).decrypt("a").should == "b"
      Minisculus::QuestionTwo::MarkII.new(2, 0, %w{a b c}).decrypt("a").should == "c"
    end

    it "should shift multiple characters in a set by the first wheel key key" do
      Minisculus::QuestionTwo::MarkII.new(1, 0, %w{a b c}).decrypt("ab").should == "bc"
    end

    it "should go back to the beginning of the set when shifting moves off the end of the set" do
      Minisculus::QuestionTwo::MarkII.new(2, 0, %w{a b c}).decrypt("b").should == "a"
      Minisculus::QuestionTwo::MarkII.new(1, 0, %w{a b c}).decrypt("bc").should == "ca"
    end
  end
  
  context "with the first wheel set to zero" do
    it "should shift a character in a set by 2x the second wheel key in reverse when decrypting" do
      Minisculus::QuestionTwo::MarkII.new(0, 1, %w{a b c d e}).decrypt("c").should == "a"
      Minisculus::QuestionTwo::MarkII.new(0, 2, %w{a b c d e}).decrypt("d").should == "e"
    end

    it "should shift multiple characters in a set by the second wheel key" do
      Minisculus::QuestionTwo::MarkII.new(0, 2, %w{a b c d e}).decrypt("de").should == "ea"
    end
  end
  
  context "with both wheels set" do
    it "should tranpose the character using both wheels" do
      Minisculus::QuestionTwo::MarkII.new(1, 1, %w{a b c d e}).decrypt("c").should == "b"
    end
  end
end
