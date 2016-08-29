require "spec_helper"

describe Bitflyer::Executions do
  describe ".history" do
    it "gets list executions" do
      VCR.use_cassette("get_execution_history") do
        executions = described_class.history(product_code: "BTC_JPY")
        p executions.first
        expect(executions).not_to be_empty
        expect(executions.first.id).to eq(4532764)
        expect(executions.first.side).to eq("BUY")
        expect(executions.first.price).to eq(58538.0)
        expect(executions.first.size).to eq(0.2)
        expect(executions.first.exec_date).to eq("2016-08-29T10:37:57.853")
        expect(executions.first.buy_child_order_acceptance_id).to eq("JRF20160829-103757-110075")
        expect(executions.first.sell_child_order_acceptance_id).to eq("JRF20160829-193753-630680")
      end
    end
  end
end
