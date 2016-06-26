require_relative 'app_logger'
require_relative 'log_hook'
require_relative 'validation_hook'

module TaxesCalculator
  # Overal parser functionalities
  class Parser
    attr_reader :data, :parset_date

    def self.inherited(child)
      child.extend LogHook
      child.extend ValidationHook
    end
  end
end
