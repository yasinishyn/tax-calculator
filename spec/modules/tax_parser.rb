require_relative '../spec_helper'
describe TaxesCalculator::TaxParser do
  context 'validations' do
    it 'raises exception if argument is not an array' do
      expect { TaxesCalculator::TaxParser.new(nil) }.to(
        raise_error(TaxesCalculator::ArgumentError)
      )
    end

    it 'should not raise exception if argument is array' do
      arg = [
        {
          quantity: 1,
          product_name: 'imported bottle of perfume',
          price: '32.19 1',
          category: 'import'
        },
        {
          quantity: 1,
          product_name: 'bottle of perfume',
          price: '20.89 1',
          category: 'standart'
        },
        {
          quantity: 1,
          product_name: 'packet of headache pills',
          price: '9.75 1',
          category: 'medical products'
        },
        {
          quantity: 1,
          product_name: 'imported box of chocolates',
          price: '11.85',
          category: 'import'
        }
      ]
      expect { TaxesCalculator::TaxParser.new(arg) }.to_not(
        raise_error(TaxesCalculator::ArgumentError)
      )
    end
  end
end
