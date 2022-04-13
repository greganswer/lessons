require 'rspec'

# [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]

RSpec.describe 'fib' do
  context 'when 0' do
    it { expect(fib(0)).to eq(0) }
  end
end
