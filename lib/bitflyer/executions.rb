module Bitflyer
  module Executions
    def self.history(options = {})
      executions = Bitflyer::Net.get("/v1/executions", options)
      JSON.parse(executions).map do |execution|
        Bitflyer::Execution.new(execution)
      end
    end
  end
end
