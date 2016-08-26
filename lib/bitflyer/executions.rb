module Bitflyer
  module Executions
    def self.all(options = {})
      result = Bitflyer::Net.get("/v1/executions", options)
      JSON.parse(result).map do |trade_attr|
        Bitflyer::Execution.new(trade_attr)
      end
    end
  end
end
