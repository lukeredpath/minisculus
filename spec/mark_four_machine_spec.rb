require 'spec_helper'
require 'machines'

describe "Mark IV machine" do
  context "with zero for the first two wheels" do
    it "should not change a single character string as the third wheel defaults to zero" do
      Minisculus::Machines.MarkIV(0, 0, %w{a b c d e}).encrypt("c").should == "c"
      Minisculus::Machines.MarkIV(0, 0, %w{a b c d e}).decrypt("c").should == "c"
    end
    
    it "should change the second character of a string based on the position of the first char" do
      Minisculus::Machines.MarkIV(0, 0, %w{a b c d e}).encrypt("bc").should == "be"
      Minisculus::Machines.MarkIV(0, 0, %w{a b c d e}).decrypt("be").should == "bc"
    end

    it "should change the third character of a string based on the position of the second char" do
      Minisculus::Machines.MarkIV(0, 0, %w{a b c d e}).encrypt("bca").should == "bee"
      Minisculus::Machines.MarkIV(0, 0, %w{a b c d e}).decrypt("bee").should == "bca"
    end
  end
  
  context "with a non-zero value for the first wheel" do
    it "should just shift a single character to the right" do
      Minisculus::Machines.MarkIV(1, 0, %w{a b c d e}).encrypt("c").should == "d"
      Minisculus::Machines.MarkIV(1, 0, %w{a b c d e}).decrypt("d").should == "c"
    end
    
    it "should change the second character of a string based on the position of the first char * 2" do
      Minisculus::Machines.MarkIV(1, 0, %w{a b c d e}).encrypt("bc").should == "ca"
      Minisculus::Machines.MarkIV(1, 0, %w{a b c d e}).decrypt("ca").should == "bc"
    end
  
    it "should change the third character of a string based on the position of the second char * 2" do
      Minisculus::Machines.MarkIV(1, 0, %w{a b c d e}).encrypt("bca").should == "caa"
      Minisculus::Machines.MarkIV(1, 0, %w{a b c d e}).decrypt("caa").should == "bca"
    end
  end
  
  context "with a non-zero value for the second wheel" do
    it "should just shift a single character to the left * 2" do
      Minisculus::Machines.MarkIV(0, 1, %w{a b c d e}).encrypt("c").should == "a"
      Minisculus::Machines.MarkIV(0, 1, %w{a b c d e}).decrypt("a").should == "c"
    end
    
    it "should change the second character of a string based on the position of the first char * 2" do
      Minisculus::Machines.MarkIV(0, 1, %w{a b c d e}).encrypt("bc").should == "ec"
      Minisculus::Machines.MarkIV(0, 1, %w{a b c d e}).decrypt("ec").should == "bc"
    end
  
    it "should change the third character of a string based on the position of the second char * 2" do
      Minisculus::Machines.MarkIV(0, 1, %w{a b c d e}).encrypt("bca").should == "ecc"
      Minisculus::Machines.MarkIV(0, 1, %w{a b c d e}).decrypt("ecc").should == "bca"
    end
  end
end
