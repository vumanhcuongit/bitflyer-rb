module Bitflyer
  module Balances
    def self.all
      Bitflyer.sanity_check!
      balances = Bitflyer::Net.get("/v1/me/getbalance", {}, true)

      JSON.parse(balances).map do |balance|
        Bitflyer::Balance.new(balance)
      end
    end
  end
end
