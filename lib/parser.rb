require_relative 'app_logger'
require_relative 'log_hook'
require_relative 'validation_hook'

module TaxesCalculator
  # Overal parser functionalities
  class Parser
    attr_reader :data, :parset_data

    def self.inherited(child)
      child.extend LogHook
      child.extend ValidationHook
    end

    private

    def _to_nearest_fifth(amount)
      (amount * 20.00).round / 20.00
    end
  end
end
