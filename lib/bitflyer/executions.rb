module Bitflyer
  module Executions
    def self.all(options = {})
      result = Bitflyer::Net.get("/v1/executions", options)
      JSON.parse(result).map do |exectuion|
        Bitflyer::Execution.new(exectuion)
      end
    end
  end
end
