require 'spec_helper'

RSpec.describe Checksum do

  describe "product" do
    it "should be the sum of products of the reversed account number digits and their positions" do
      expect(Checksum.new(457508000).product).to eq(187)
      expect(Checksum.new(51).product).to eq(11)
      expect(Checksum.new(123456789).product).to eq(165)
    end
  end

  describe "result" do
    it "should be 0 for the modulus 11 of the product" do
      expect(Checksum.new(457508000).result).to eq(0)
      expect(Checksum.new(51).result).to eq(0)
      expect(Checksum.new(123456789).result).to eq(0)
    end
  end

  describe "valid?" do
    it "should be valid if the result is 0, and invalid otherwise" do
      expect(Checksum.new(457508000).valid?).to eq(true)
      expect(Checksum.new(567889).valid?).to eq(false)
      expect(Checksum.new(123456789).valid?).to eq(true)
    end
  end

end