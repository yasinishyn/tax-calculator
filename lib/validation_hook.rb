module TaxesCalculator
  module ValidationHook
    def validate_type_before(*methods, type)
      to_prepend = Module.new do
        methods.each do |method|
          define_method(method) do |*args, &block|
            unless args.all? { |el| el.is_a? type }
              LOGGER.fatal "#{Time.now}: Called method (#{method}) of #{self}, with invalid args"
              raise ArgumentError
            end
            super(*args, &block)
          end
        end
      end
      prepend to_prepend
    end
  end
end
