require_relative '../spec_helper'
describe TaxesCalculator::Clalculate do
  context 'validations' do
    it 'raises exception if argument is not a string' do
      expect { TaxesCalculator::Clalculate.new(nil) }.to(
        raise_error(TaxesCalculator::ArgumentError)
      )
    end

    it 'should not raise exception if argument string' do
      arg = %(
        1, imported bottle of perfume, 32.19 1, bottle of perfume, 20.89 1,
        packet of headache pills, 9.75 1, imported box of chocolates, 11.85
      )
      expect { TaxesCalculator::Clalculate.new(arg) }.to_not(
        raise_error(TaxesCalculator::ArgumentError)
      )
    end
  end
end
