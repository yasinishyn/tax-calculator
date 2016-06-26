require_relative '../spec_helper'
describe TaxesCalculator::IntpuParser do
  let(:args) do
    %(
      1, imported bottle of perfume, 32.19 1, bottle of perfume, 20.89 1,
      packet of headache pills, 9.75 1, imported box of chocolates, 11.85
    )
  end

  context 'validations' do
    it 'raises exception if argument is not a string' do
      expect { TaxesCalculator::IntpuParser.new(nil) }.to(
        raise_error(TaxesCalculator::ArgumentError)
      )
    end

    it 'should not raise exception if argument string' do
      expect { TaxesCalculator::IntpuParser.new(args) }.to_not(
        raise_error(TaxesCalculator::ArgumentError)
      )
    end
  end

  context 'parse' do
    before(:each) do
      @data = TaxesCalculator::IntpuParser.new(args).parse
    end
    it 'should transform data into array' do
      expect(@data.class).to eq(Array)
    end

    it 'array should be array of hashed' do
      @data.each do |el|
        expect(el.is_a?(Hash)).to eq(true)
      end
    end
  end
end
