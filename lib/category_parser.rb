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
  #     categories: ['import']
  #   },
  #   {
  #     quantity: 1,
  #     product_name: 'bottle of perfume',
  #     price: '20.89 1',
  #     categories: []
  #   },
  #   {
  #     quantity: 1,
  #     product_name: 'packet of headache pills',
  #     price: '9.75 1',
  #     categories: ['medical']
  #   },
  #   {
  #     quantity: 1,
  #     product_name: 'imported box of chocolates',
  #     price: '11.85',
  #     categories: ['import']
  #   }
  # ]
  class CategoryParser < Parser
    log_before :initialize, :parse
    validate_type_before :initialize, Array

    def initialize(data)
      @data = data
    end

    def parse
      @parset_date = @data.map do |el|
        el[:categories] = []
        el[:categories] << 'import'  if el[:product_name] =~ /import/
        el[:categories] << 'medical' if el[:product_name] =~ /pills/
        el[:categories] << 'book'    if el[:product_name] =~ /book/
        el
      end
    end
  end
end
