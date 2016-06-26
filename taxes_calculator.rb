require 'csv'
Dir[[__dir__, 'lib', '*.rb'].join('/')].map { |file| require file }

module TaxesCalculator
  # This module calculates the total price of products, and total taxes payes
  #
  # This is a composite class, that delegates responsibility to other classes
  #
  # All classes are folowing (S)OLID single responsibility
  #
  # Output data structure is optimised for ease of transformation to CSV
  #
  # Input: 1, imported bottle of perfume, 32.19 1,
  #           bottle of perfume, 20.89 1,
  #           packet of headache pills, 9.75 1,
  #           imported box of chocolates, 11.85
  # Output:
  # [
  #   {
  #     quantity: 1,
  #     product_name: 'imported bottle of perfume',
  #     price: '32.19 1',
  #     category: 'import',
  #     taxes: '5.00',
  #     total: '74.68',
  #     total_taxes: '7.70'
  #   },
  #   {
  #     quantity: 1,
  #     product_name: 'bottle of perfume',
  #     price: '20.89 1',
  #     category: 'standart',
  #     taxes: '2.10',
  #     total: '74.68',
  #     total_taxes: '7.70'
  #   },
  #   {
  #     quantity: 1,
  #     product_name: 'packet of headache pills',
  #     price: '9.75 1',
  #     category: 'medical products',
  #     taxes: '0',
  #     total: '74.68',
  #     total_taxes: '7.70'
  #   },
  #   {
  #     quantity: 1,
  #     product_name: 'imported box of chocolates',
  #     price: '11.85',
  #     category: 'import',
  #     taxes: '0.60',
  #     total: '74.68',
  #     total_taxes: '7.70'
  #   }
  # ]
  class Clalculate < Parser
    attr_reader :data
    log_before :initialize, :calculate
    validate_type_before :initialize, String

    def initialize(data)
      data = IntpuParser.new(data).parse
      data = CategoryParser.new(data).parse
      @data = TaxParser.new(data).parse
    end

    def calculate
      # TODO: to be implemented
    end
  end
end
