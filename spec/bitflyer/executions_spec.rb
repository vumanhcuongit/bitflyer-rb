require "spec_helper"
require "bitflyer"

describe Bitflyer::Orders do
end

describe Bitflyer::Executions do
  it "gets list executions" do
    VCR.use_cassette("get_executions") do
      executions = described_class.all(product_code: "BTC_JPY")

      expect(executions).not_to be_empty
      expect(executions.first.id).to eq(4433983)
      expect(executions.first.side).to eq("BUY")
      expect(executions.first.price).to eq(58497.0)
      expect(executions.first.size).to eq(1.0)
      expect(executions.first.exec_date).to eq("2016-08-26T09:03:00.12")
      expect(executions.first.buy_child_order_acceptance_id).to eq("JRF20160826-090257-039754")
      expect(executions.first.sell_child_order_acceptance_id).to eq("JRF20160826-180249-021576")
    end
  end
end
