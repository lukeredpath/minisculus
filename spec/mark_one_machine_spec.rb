require 'spec_helper'
require 'machines'

describe "Mark I machine" do 
  it "should shift a character in a set by the given key when decrypting" do
    Minisculus::Machines.MarkI(1, %w{a b c}).encrypt("a").should == "b"
    Minisculus::Machines.MarkI(2, %w{a b c}).encrypt("a").should == "c"
  end
  
  it "should shift multiple characters in a set by the given key" do
    Minisculus::Machines.MarkI(1, %w{a b c}).encrypt("ab").should == "bc"
  end
  
  it "should go back to the beginning of the set when shifting moves off the end of the set" do
    Minisculus::Machines.MarkI(2, %w{a b c}).encrypt("b").should == "a"
    Minisculus::Machines.MarkI(1, %w{a b c}).encrypt("bc").should == "ca"
  end
  
  context "with default character set and a key of 5" do
    before do
      @machine = Minisculus::Machines.MarkI(5)
    end
    
    it "should decrypt 'a' as 'f'" do
      @machine.encrypt('a').should == 'f'
    end
    
    it "should decrypt 'c' as 'h'" do
      @machine.encrypt('c').should == 'h'
    end
  end
end
