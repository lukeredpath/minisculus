require 'spec_helper'
require 'machines'

describe "Charset" do
  it "should return character at index within bounds" do
    Minisculus::Charset.new(%w{a b c})[1].should == "b"
  end
  
  it "should return character from the end of the array with negative index" do
    Minisculus::Charset.new(%w{a b c})[-1].should == "c"
    Minisculus::Charset.new(%w{a b c})[-3].should == "a"
    Minisculus::Charset.new(%w{a b c})[-4].should == "c"
  end
  
  it "should return character from the front of the array with index greater than length of array" do
    Minisculus::Charset.new(%w{a b c})[3].should == "a"
    Minisculus::Charset.new(%w{a b c})[4].should == "b"
    Minisculus::Charset.new(%w{a b c})[6].should == "a"
  end
end
