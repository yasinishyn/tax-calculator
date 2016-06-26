require_relative 'parser'
require_relative 'exceptions'

module TaxesCalculator
  # Class for parsing input, and transformint it into usable datastructure
  # input: 1, imported bottle of perfume, 32.19 1,
  #           bottle of perfume, 20.89 1,
  #           packet of headache pills, 9.75 1,
  #           imported box of chocolates, 11.85
  # Output
  # [
  #   {
  #     quantity: 1,
  #     product_name: 'imported bottle of perfume',
  #     price: '32.19 1'
  #   },
  #   {
  #     quantity: 1,
  #     product_name: 'bottle of perfume',
  #     price: '20.89 1'
  #   },
  #   {
  #     quantity: 1,
  #     product_name: 'packet of headache pills',
  #     price: '9.75 1'
  #   },
  #   {
  #     quantity: 1,
  #     product_name: 'imported box of chocolates',
  #     price: '11.85'
  #   }
  # ]
  class IntpuParser < Parser
    log_before :initialize, :parse
    validate_type_before :initialize, String

    def initialize(data)
      @data = data
    end

    def parse
      input = @data.split(',').map(&:strip)
      quantity = input.shift

      @parset_date = input.each_slice(2).to_a.map! do |el|
        { quantity: quantity,
          product_name: el[0],
          price: el[1].gsub(/\s#{quantity}/, '').to_f }
      end
    end
  end
end
