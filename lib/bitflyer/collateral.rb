module Bitflyer
  module Collateral
    def self.all(options = {})
      Bitflyer.sanity_check!
      collateral = Bitflyer::Net.get("/v1/me/getcollateral", options, true)
      Bitflyer::Collateral.new(JSON.parse(collateral))
    end
  end
end
