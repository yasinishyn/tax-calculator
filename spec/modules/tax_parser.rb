require_relative '../spec_helper'
describe TaxesCalculator::TaxParser do
  let(:args) do
    [
      {
        quantity: 1,
        product_name: 'imported bottle of perfume',
        price: 32.19,
        categories: %w(import)
      },
      {
        quantity: 1,
        product_name: 'bottle of perfume',
        price: 20.89,
        categories: []
      },
      {
        quantity: 1,
        product_name: 'packet of headache pills',
        price: 9.75,
        categories: %w(medical)
      },
      {
        quantity: 1,
        product_name: 'imported box of chocolates',
        price: 11.85,
        categories: %w(import food)
      }
    ]
  end

  context 'validations' do
    it 'raises exception if argument is not an array' do
      expect { TaxesCalculator::TaxParser.new(nil) }.to(
        raise_error(TaxesCalculator::ArgumentError)
      )
    end

    it 'should not raise exception if argument is array' do
      expect { TaxesCalculator::TaxParser.new(args) }.to_not(
        raise_error(TaxesCalculator::ArgumentError)
      )
    end
  end

  context 'parse' do
    before(:each) do
      @data = TaxesCalculator::TaxParser.new(args).parse
    end

    it 'should add taxes key to each nested hash' do
      @data.each do |el|
        expect(el[:taxes].class).to eq(Float)
      end
    end

    it 'should have none tax if: medical, book or food ' do
      packet_of_headache_pills = @data.select do |el|
        el[:product_name] == 'packet of headache pills'
      end
      packet_of_headache_pills = packet_of_headache_pills.shift
      expect(packet_of_headache_pills[:taxes]).to eq(0.00)
    end

    it 'should have none tax if: medical, book or food' do
      packet_of_headache_pills = @data.select do |el|
        el[:product_name] == 'packet of headache pills'
      end
      packet_of_headache_pills = packet_of_headache_pills.shift
      expect(packet_of_headache_pills[:taxes]).to eq(0.00)
    end

    it 'should have import tax with no exemptions' do
      imported_box_of_chocolates = @data.select do |el|
        el[:product_name] == 'imported box of chocolates'
      end
      imported_box_of_chocolates = imported_box_of_chocolates.shift
      expect(imported_box_of_chocolates[:taxes]).to eq(0.60)
    end
  end
end
