require 'spec_helper'

RSpec.describe AccountNumber do

  before do
    @sample_1 = "86110??36"
    @sample_2 = "664371495"
    @sample_3 = "457508000"
  end

  describe "status" do
    it "should have an ILLEGIBLE status if the account number has errors in it" do
      account_number = AccountNumber.new(@sample_1)
      expect(account_number.status).to eq(AccountStatus::ILLEGIBLE)
    end

    it "should have an ERROR status if the account number failed the checksum" do
      account_number = AccountNumber.new(@sample_2)
      expect(account_number.status).to eq(AccountStatus::ERROR)
    end

    it "should have NO status if the account number is otherwise valid" do
      account_number = AccountNumber.new(@sample_3)
      expect(account_number.status).to be(nil)
    end
  end

  describe "checksum" do
    it "should be present" do
      account_number = AccountNumber.new(@sample_3)
      expect(account_number.checksum).to be_a(Checksum)
    end
  end

end