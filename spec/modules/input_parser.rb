require_relative '../spec_helper'
describe TaxesCalculator::IntpuParser do
  context 'validations' do
    it 'raises exception if argument is not a string' do
      expect { TaxesCalculator::IntpuParser.new(nil) }.to raise_error(TaxesCalculator::ArgumentError)
    end
  end
end
