require 'spec_helper'
require 'question-1/question_one'

describe "Mark I machine" do # basic ceasar/shift cypher
  include Minisculus::QuestionOne
  
  it "should shift a character in a set by the given key when decrypting" do
    Minisculus::QuestionOne::MarkI.new(1, %w{a b c}).decrypt("a").should == "b"
    Minisculus::QuestionOne::MarkI.new(2, %w{a b c}).decrypt("a").should == "c"
  end
  
  it "should shift multiple characters in a set by the given key" do
    Minisculus::QuestionOne::MarkI.new(1, %w{a b c}).decrypt("ab").should == "bc"
  end
  
  it "should go back to the beginning of the set when shifting moves off the end of the set" do
    Minisculus::QuestionOne::MarkI.new(2, %w{a b c}).decrypt("b").should == "a"
    Minisculus::QuestionOne::MarkI.new(1, %w{a b c}).decrypt("bc").should == "ca"
  end
  
end
