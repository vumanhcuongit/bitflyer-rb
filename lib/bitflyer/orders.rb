module Bitflyer
  module Orders
    def self.create(options = {})
      Bitflyer.sanity_check!
      result = Bitflyer::Net.post("/v1/me/sendchildorder", options)
      Bitflyer::Order.new(JSON.parse(result))
    end

    def self.cancel(options = {})
      Bitflyer.sanity_check!
      Bitflyer::Net.post("/v1/me/cancelchildorder", options)
    end
  end
end
