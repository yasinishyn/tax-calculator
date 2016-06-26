require_relative 'taxes_calculator'

# TaxesCalculator::Clalculate.new(ARGV[0]).calculate

input = %(
  1, imported bottle of perfume, 32.19 1,bottle of perfume,
  20.89 1,packet of headache pills, 9.75 1,
  imported box of chocolates, 11.85
)

TaxesCalculator::Clalculate.new(input).calculate
