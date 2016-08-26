require "spec_helper"

describe Bitflyer::Balances do
  before do
    Bitflyer.setup do |config|
      config.key = ENV["KEY"]
      config.secret = ENV["SECRET"]
    end
  end

  it "gets list balances" do
    VCR.use_cassette("get_balances") do
      balances = described_class.all

      expect(balances).not_to be_empty
      expect(balances.first.currency_code).to eq("JPY")
      expect(balances.first.amount).not_to be_nil
      expect(balances.first.available).not_to be_nil
    end
  end
end
