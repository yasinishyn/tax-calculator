require_relative '../spec_helper'
describe TaxesCalculator::CategoryParser do
  context 'validations' do
    it 'raises exception if argument is not an array' do
      expect { TaxesCalculator::CategoryParser.new(nil) }.to raise_error(TaxesCalculator::ArgumentError)
    end
  end
end
