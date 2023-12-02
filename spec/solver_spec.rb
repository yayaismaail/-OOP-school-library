# require_relative 'solver'
require './solver'
require 'rspec'

describe Solver do
  before(:each) do
    @solver = Solver
  end

  it 'returns factorial of a number' do
    expect(@solver.factorial(0)).to eq(1)
    expect { @solver.factorial(-3) }.to raise_error(ArgumentError, 'Input must be a non-negative integer')
  end

  it 'reverses a given word' do
    expect(@solver.reverse('hello')).to eq('olleh')
    expect(@solver.reverse('world')).to eq('dlrow')
  end

  it 'applies fizzbuzz rules' do
    expect(@solver.fizzbuzz(3)).to eq('fizz')
    expect(@solver.fizzbuzz(5)).to eq('buzz')
    expect(@solver.fizzbuzz(15)).to eq('fizzbuzz')
    expect(@solver.fizzbuzz(7)).to eq('7')
    expect { @solver.fizzbuzz('abc') }.to raise_error(ArgumentError, 'Input must be an integer')
  end
end
