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
  #     price: 32.19,
  #     categories: ['import'],
  #     taxes: 5.00,
  #     total: 74.68,
  #     total_taxes: 7.70
  #   },
  #   {
  #     quantity: 1,
  #     product_name: 'bottle of perfume',
  #     price: 20.89,
  #     categories: [],
  #     taxes: 2.10,
  #     total: 74.68,
  #     total_taxes: 7.70
  #   },
  #   {
  #     quantity: 1,
  #     product_name: 'packet of headache pills',
  #     price: 9.75,
  #     categories: ['medical'],
  #     taxes: 0,
  #     total: 74.68,
  #     total_taxes: 7.70
  #   },
  #   {
  #     quantity: 1,
  #     product_name: 'imported box of chocolates',
  #     price: 11.85,
  #     categories: ['import', 'food'],
  #     taxes: 0.60,
  #     total: 74.68,
  #     total_taxes: 7.70
  #   }
  # ]
  class Clalculate < Parser
    attr_reader :with_tax, :total, :total_taxes
    log_before :initialize, :calculate
    validate_type_before :initialize, String

    def initialize(data)
      @data = data
      res = IntpuParser.new(@data).parse
      res = CategoryParser.new(res).parse
      @with_tax = TaxParser.new(res).parse
    end

    def calculate
      @total = with_tax.inject(0.00) { |a, e| a + e[:price] }
      @total_taxes = with_tax.inject(0.00) { |a, e| a + e[:taxes] }
      @total = _to_nearest_fifth(total)
      @total_taxes = _to_nearest_fifth(total_taxes)
      _print
    end

    private

    def _print
      p data
      p "Sales Taxes: #{total_taxes} Total #{total}"
    end
  end
end
