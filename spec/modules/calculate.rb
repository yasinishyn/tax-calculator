require_relative '../spec_helper'
describe TaxesCalculator::Clalculate do
  let(:args) do
    %(
      1, imported bottle of perfume, 32.19 1, bottle of perfume, 20.89 1,
      packet of headache pills, 9.75 1, imported box of chocolates, 11.85
    )
  end

  context 'validations' do
    it 'raises exception if argument is not a string' do
      expect { TaxesCalculator::Clalculate.new(nil) }.to(
        raise_error(TaxesCalculator::ArgumentError)
      )
    end

    it 'should not raise exception if argument string' do
      expect { TaxesCalculator::Clalculate.new(args) }.to_not(
        raise_error(TaxesCalculator::ArgumentError)
      )
    end
  end

  context 'parse' do
    before(:each) do
      @calculate = TaxesCalculator::Clalculate.new(args)
      @calculate.calculate
    end

    it 'should return correct total' do
      expect(@calculate.total).to eq(74.7)
    end

    it 'should return correct total_taxes' do
      expect(@calculate.total_taxes).to eq(7.5)
    end
  end
end
