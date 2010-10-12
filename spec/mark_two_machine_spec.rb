require 'spec_helper'
require 'machines'

describe "Mark II example with wheels set to 2 and 5" do
  it "should translate 'abc' to 'STU'" do
    Minisculus::Machines.MarkII(2, 5).encrypt('abc').should == 'STU'
  end
end

describe "Mark II" do
  context "with the second wheel set to zero" do
    it "should shift a character in a set by the given first wheel key when decrypting" do
      Minisculus::Machines.MarkII(1, 0, %w{a b c}).encrypt("a").should == "b"
      Minisculus::Machines.MarkII(2, 0, %w{a b c}).encrypt("a").should == "c"
    end

    it "should shift multiple characters in a set by the first wheel key key" do
      Minisculus::Machines.MarkII(1, 0, %w{a b c}).encrypt("ab").should == "bc"
    end

    it "should go back to the beginning of the set when shifting moves off the end of the set" do
      Minisculus::Machines.MarkII(2, 0, %w{a b c}).encrypt("b").should == "a"
      Minisculus::Machines.MarkII(1, 0, %w{a b c}).encrypt("bc").should == "ca"
    end
  end
  
  context "with the first wheel set to zero" do
    it "should shift a character in a set by 2x the second wheel key in reverse when decrypting" do
      Minisculus::Machines.MarkII(0, 1, %w{a b c d e}).encrypt("c").should == "a"
      Minisculus::Machines.MarkII(0, 2, %w{a b c d e}).encrypt("d").should == "e"
    end

    it "should shift multiple characters in a set by the second wheel key" do
      Minisculus::Machines.MarkII(0, 2, %w{a b c d e}).encrypt("de").should == "ea"
    end
  end
  
  context "with both wheels set" do
    it "should tranpose the character using both wheels" do
      Minisculus::Machines.MarkII(1, 1, %w{a b c d e}).encrypt("c").should == "b"
    end
  end
end
