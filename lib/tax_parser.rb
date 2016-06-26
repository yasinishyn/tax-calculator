require_relative 'parser'
require_relative 'exceptions'

module TaxesCalculator
  # Class for parsing product category
  # Input:
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
  # Output:
  # [
  #   {
  #     quantity: 1,
  #     product_name: 'imported bottle of perfume',
  #     price: '32.19 1',
  #     categories: ['import'],
  #     taxes: '5.00'
  #   },
  #   {
  #     quantity: 1,
  #     product_name: 'bottle of perfume',
  #     price: '20.89 1',
  #     categories: [],
  #     taxes: '2.10'
  #   },
  #   {
  #     quantity: 1,
  #     product_name: 'packet of headache pills',
  #     price: '9.75 1',
  #     categories: ['medical'],
  #     taxes: '0'
  #   },
  #   {
  #     quantity: 1,
  #     product_name: 'imported box of chocolates',
  #     price: '11.85',
  #     categories: ['import', 'food'],
  #     taxes: '0.60'
  #   }
  # ]
  class TaxParser < Parser
    log_before :initialize, :parse
    validate_type_before :initialize, Array

    # TaxParser need data items to include category
    def initialize(data)
      raise ArgumentError unless data.all? { |el| el[:categories] }
      @data = data
    end

    def parse
      @parset_data = @data.map do |el|
        el[:taxes] = 0.00
        if el[:categories].include?('import')
          el[:taxes] += _import_tax(el[:price])
        end
        unless %w(medical book food).any? { |c| el[:categories].include?(c) }
          el[:taxes] += _standart_tax(el[:price])
        end
        el
      end
    end

    private

    def _import_tax(price)
      _to_nearest_fifth((price * 1.05) - price)
    end

    def _standart_tax(price)
      _to_nearest_fifth((price * 1.10) - price)
    end
  end
end
