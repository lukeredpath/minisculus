require 'spec_helper'
require 'machines'

describe "Mark IV machine" do
  it "should not change a single character string as the third wheel defaults to zero" do
    Minisculus::Machines.MarkIV(0, 0, %w{a b c d e}).encrypt("c").should == "c"
    Minisculus::Machines.MarkIV(1, 0, %w{a b c d e}).encrypt("c").should == "d"
    Minisculus::Machines.MarkIV(1, 1, %w{a b c d e}).encrypt("c").should == "b"
    Minisculus::Machines.MarkIV(1, 2, %w{a b c d e}).encrypt("b").should == "d"
  end
  
  it "should change the second character of a string based on the position of the first char" do
    Minisculus::Machines.MarkIV(0, 0, %w{a b c d e}).encrypt("bc").should == "be"
    Minisculus::Machines.MarkIV(1, 2, %w{a b c d e}).encrypt("bc").should == "db"
  end
  
  it "should change the third character of a string based on the position of the second char" do
    Minisculus::Machines.MarkIV(0, 0, %w{a b c d e}).encrypt("bca").should == "bee"
    Minisculus::Machines.MarkIV(1, 2, %w{a b c d e}).encrypt("bcd").should == "dbe"
  end
end
