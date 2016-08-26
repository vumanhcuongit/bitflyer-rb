module Bitflyer
  module Executions
    def self.all(options = {})
      result = Bitflyer::Net.get("/v1/executions", options)
      JSON.parse(result).map do |execution|
        Bitflyer::Execution.new(execution)
      end
    end
  end
end
