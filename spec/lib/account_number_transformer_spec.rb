require 'spec_helper'

RSpec.describe AccountNumberTransformer do
  before do
    @sample_account = [
      "    _  _     _  _  _  _  _ ",
      "  | _| _||_||_ |_   ||_||_|",
      "  ||_  _|  | _||_|  ||_| _|"
    ]
  end

  describe "account_number" do
    it "should be nil before the transformation takes place" do
      transformer = AccountNumberTransformer.new(@sample_account)
      expect(transformer.account_number).to be_nil
    end
  end

  describe "transform" do
    it "should produce an account number" do
      transformer = AccountNumberTransformer.new(@sample_account)
      transformer.transform
      expect(transformer.account_number).to be_a(AccountNumber)
      expect(transformer.account_number.number).to eq("123456789")
    end
  end
end