require 'spec_helper'
require 'question-2/question_two'

describe "Mark II example with wheels set to 2 and 5" do
  include Minisculus::QuestionTwo
  
  it "should translate 'abc' to 'STU'" do
    MarkII.new(2, 5).decrypt('abc').should == 'STU'
  end
end
