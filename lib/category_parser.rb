require_relative 'parser'
require_relative 'exceptions'

module TaxesCalculator
  # Class for parsing product category
  # Input:
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
  # Output
  # [
  #   {
  #     quantity: 1,
  #     product_name: 'imported bottle of perfume',
  #     price: '32.19 1',
  #     category: 'import'
  #   },
  #   {
  #     quantity: 1,
  #     product_name: 'bottle of perfume',
  #     price: '20.89 1',
  #     category: 'standart'
  #   },
  #   {
  #     quantity: 1,
  #     product_name: 'packet of headache pills',
  #     price: '9.75 1',
  #     category: 'medical products'
  #   },
  #   {
  #     quantity: 1,
  #     product_name: 'imported box of chocolates',
  #     price: '11.85',
  #     category: 'import'
  #   }
  # ]
  class CategoryParser < Parser
    log_before :initialize, :parse
    validate_type_before :initialize, Array

    def initialize(data)
      @data = data
    end

    def parse
      # TODO: to be implemented
    end
  end
end
