require 'spec_helper'
require_relative '../support/digit_helper'

RSpec.describe DigitConverter do

  before do
    @digits = DigitHelper::setup_digits
    @bad_digit =
    "   " +
    " _|" +
    "  |"
  end

  describe "number" do
    it "should properly convert the digits 0 - 9" do
      (0..9).to_a.each do |digit|
        expect(DigitConverter.new(@digits[digit.to_s]).number).to eq(digit)
      end
    end

    it "should not convert bad digits" do
      expect(DigitConverter.new(@bad_digit).number).to be(nil)
    end
  end

  describe "character" do
    it "should be a displayable version of the digit" do
      expect(DigitConverter.new(@digits["2"]).character).to eq("2")
      expect(DigitConverter.new(@digits["3"]).character).to eq("3")
      expect(DigitConverter.new(@bad_digit).character).to eq("?")
    end
  end
end