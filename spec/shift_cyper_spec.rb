require 'spec_helper'
require 'shift_cypher'

describe "ShiftCypher" do
  context "with no wheels" do
    before do
      @cyper = Minisculus::ShiftCypher.new([], [])
    end
    
    it "should return the same string as the input when crypting" do
      @cyper.encrypt("foo").should == "foo"
    end
    
    it "should return the same string as the input when decrypting" do
      @cyper.decrypt("foo").should == "foo"
    end
  end
  
  context "with a 1> wheel" do
    before do
      @cyper = Minisculus::ShiftCypher.new([wheel(1, false)], Minisculus::DEFAULT_CHARSET)
    end
    
    it "should shift every character 1 to the right by one when encrypting" do
      @cyper.encrypt("abc").should == "bcd"
    end
    
    it "should shift every character 1 to the left by one when decrypting" do
      @cyper.decrypt("bcd").should == "abc"
    end
  end
  
  context "with a 2< wheel" do
    before do
      @cyper = Minisculus::ShiftCypher.new([wheel(2, true)], Minisculus::DEFAULT_CHARSET)
    end
    
    it "should shift every character 2 to the left by one when encrypting" do
      @cyper.encrypt("abc").should == "YZa"
    end
    
    it "should shift every character 2 to the right by one when decrypting" do
      @cyper.decrypt("YZa").should == "abc"
    end
  end
  
  context "with a last position > wheel" do
    before do
      @cypher = Minisculus::ShiftCypher.new([Minisculus::ShiftCypher::LastPositionWheel.new], %w{a b c d e f g})
    end
    
    it "should return the input string if it is only one character long" do
      @cypher.encrypt("a").should == "a"
    end
    
    it "should shift every character to the right by the index of the previously indexed character" do
      @cypher.encrypt("bcd").should == "bdf"
    end
    
    it "should shift every character to the left by the index of the previously indexed decrypted character" do
      @cypher.decrypt("bdf").should == "bcd"
    end
  end
  
  context "with a last position > and modifier wheel" do
    before do
      @cypher = Minisculus::ShiftCypher.new([Minisculus::ShiftCypher::LastPositionWheel.new { |x| x * 2 }], %w{a b c d e f g})
    end
    
    it "should return the input string if it is only one character long" do
      @cypher.encrypt("a").should == "a"
    end
    
    it "should shift every character to the right by the index of the previously indexed character adjusted by the modifier" do
      @cypher.encrypt("bcd").should == "bea"
    end
    
    it "should shift every character to the left by the index of the previously indexed decrypted character adjusted by the modifier" do
      @cypher.decrypt("bea").should == "bcd"
    end
  end
  
  private
  
  def wheel(key, reverse)
    Minisculus::ShiftCypher::Wheel.new(key, reverse)
  end
end
