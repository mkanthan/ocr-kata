require 'spec_helper'
require_relative '../support/digit_helper'

RSpec.describe DigitMap do
  before do
    @digits = DigitHelper::setup_digits
  end

  it "should set up the correct constant values for the digit slices" do
    expect(DigitMap::ZERO).to eq(@digits["0"])
    expect(DigitMap::ONE).to eq(@digits["1"])
    expect(DigitMap::TWO).to eq(@digits["2"])
    expect(DigitMap::THREE).to eq(@digits["3"])
    expect(DigitMap::FOUR).to eq(@digits["4"])
    expect(DigitMap::FIVE).to eq(@digits["5"])
    expect(DigitMap::SIX).to eq(@digits["6"])
    expect(DigitMap::SEVEN).to eq(@digits["7"])
    expect(DigitMap::EIGHT).to eq(@digits["8"])
    expect(DigitMap::NINE).to eq(@digits["9"])
    expect(DigitMap::UNKNOWN).to eq("?")
  end
end