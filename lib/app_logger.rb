require 'logger'
require 'fileutils'

module TaxesCalculator
  # Logger for app
  class AppLogger < Logger
    %w(debug info warn error fatal).each do |method|
      define_method(method) do |*args, &block|
        p args
        super(*args, &block)
      end
    end
  end

  unless File.directory?("#{__dir__}/../log")
    FileUtils.mkdir_p("#{__dir__}/../log")
  end

  LOGGER = AppLogger.new File.new("#{__dir__}/../log/app.log", 'w')
end
