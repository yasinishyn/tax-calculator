require_relative '../spec_helper'
describe TaxesCalculator::TaxParser do
  context 'validations' do
    it 'raises exception if argument is not an array' do
      expect { TaxesCalculator::TaxParser.new(nil) }.to raise_error(TaxesCalculator::ArgumentError)
    end
  end
end
