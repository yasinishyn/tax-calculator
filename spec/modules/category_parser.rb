require_relative '../spec_helper'
describe TaxesCalculator::CategoryParser do
  context 'validations' do
    it 'raises exception if argument is not an array' do
      expect { TaxesCalculator::CategoryParser.new(nil) }.to(
        raise_error(TaxesCalculator::ArgumentError)
      )
    end

    it 'should not raise exception if argument is array' do
      arg = [
        {
          quantity: 1,
          product_name: 'imported bottle of perfume',
          price: '32.19 1'
        },
        {
          quantity: 1,
          product_name: 'bottle of perfume',
          price: '20.89 1'
        },
        {
          quantity: 1,
          product_name: 'packet of headache pills',
          price: '9.75 1'
        },
        {
          quantity: 1,
          product_name: 'imported box of chocolates',
          price: '11.85'
        }
      ]
      expect { TaxesCalculator::CategoryParser.new(arg) }.to_not(
        raise_error(TaxesCalculator::ArgumentError)
      )
    end
  end
end
