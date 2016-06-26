require_relative 'app_logger'
require_relative 'log_hook'

module TaxesCalculator
  # Overal parser functionalities
  class Parser
    attr_reader :data

    def self.inherited(child)
      child.extend LogHook
    end
  end
end
