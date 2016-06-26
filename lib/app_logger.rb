require 'logger'

module TaxesCalculator
  class AppLogger < Logger
    %w(debug info warn error fatal).each do |method|
      define_method(method) do |*args, &block|
        p(args) && super(*args,&block)
      end
    end
  end
  LOGGER = AppLogger.new File.new("#{__dir__}/../log/app.log", 'w')
end
