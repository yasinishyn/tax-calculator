require_relative '../spec_helper'
describe TaxesCalculator::CategoryParser do
  let(:args) do
    [
      {
        quantity: 1,
        product_name: 'imported bottle of perfume',
        price: 32.19
      },
      {
        quantity: 1,
        product_name: 'bottle of perfume',
        price: 20.89
      },
      {
        quantity: 1,
        product_name: 'packet of headache pills',
        price: 9.75
      },
      {
        quantity: 1,
        product_name: 'imported box of chocolates',
        price: 11.85
      }
    ]
  end

  context 'validations' do
    it 'raises exception if argument is not an array' do
      expect { TaxesCalculator::CategoryParser.new(nil) }.to(
        raise_error(TaxesCalculator::ArgumentError)
      )
    end

    it 'should not raise exception if argument is array' do
      expect { TaxesCalculator::CategoryParser.new(args) }.to_not(
        raise_error(TaxesCalculator::ArgumentError)
      )
    end
  end

  context 'parse' do
    before(:each) do
      @data = TaxesCalculator::CategoryParser.new(args).parse
    end

    it 'should add categories key to each nested hash' do
      @data.each do |el|
        expect(el[:categories].class).to eq(Array)
      end
    end

    it 'should add none categories if not: book, medical, import' do
      bottle_of_perfume = @data.select do |el|
        el[:product_name] == 'bottle of perfume'
      end
      bottle_of_perfume = bottle_of_perfume.shift
      expect(bottle_of_perfume[:categories].empty?).to eq(true)
    end
  end
end
