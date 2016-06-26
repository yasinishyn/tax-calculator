require_relative 'app_logger'

module TaxesCalculator
  # Log method pre-execution
  module LogHook
    def log_before(*methods)
      to_prepend = Module.new do
        methods.each do |method|
          define_method(method) do |*args, &block|
            LOGGER.debug %(
              #{Time.now}: Called method (#{method}) in #{self},
              with: args #{args})
            super(*args, &block)
          end
        end
      end
      prepend to_prepend
    end
  end
end
