require "spec_helper"

describe Bitflyer::Orders do
  before do
    Bitflyer.setup do |config|
      config.key = ENV["KEY"]
      config.secret = ENV["SECRET"]
    end
  end

  it "creates an order successfully" do
    VCR.use_cassette("create_new_market_order") do
      options = {
        product_code: "BTC_JPY",
        child_order_type: "MARKET",
        side: "BUY",
        size: 0.001,
      }
      order = described_class.create(options)

      expect(order.child_order_acceptance_id).not_to be_nil
      expect(order.id).to eq(order.child_order_acceptance_id)
    end
  end

  context "when product_code is wrong" do
    it "raises an error" do
      VCR.use_cassette("create_new_market_order_with_wrong_product_code") do
        options = {
          product_code: "BTC_BTC",
          child_order_type: "MARKET",
          side: "BUY",
          size: 0.001,
        }

        expect { described_class.create(options) }.to raise_error(Bitflyer::Net::BadRequest, '{"status":-100,"error_message":"Invalid product","data":null}')
      end
    end
  end

  context "when side is wrong" do
    it "raises an error" do
      VCR.use_cassette("create_new_market_order_with_wrong_side") do
        options = {
          product_code: "BTC_JPY",
          child_order_type: "MARKET",
          side: "BUYYYYYYY",
          size: 0.001,
        }

        expect { described_class.create(options) }.to raise_error(Bitflyer::Net::BadRequest, '{"status":-102,"error_message":"Invalid direction code","data":null}')
      end
    end
  end
end
