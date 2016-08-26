module Bitflyer
  module Orders
    def self.create(options = {})
      Bitflyer.sanity_check!
      result = Bitflyer::Net.post("/v1/me/sendchildorder", options)
      Bitflyer::Order.new(JSON.parse(result))
    end
  end
end
