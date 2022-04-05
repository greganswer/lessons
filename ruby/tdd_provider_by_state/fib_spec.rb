require 'rspec'

# [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]

RSpec.describe 'fib' do
  subject { fib(n) }

  context 'when 0' do
    let(:n) { 0 }
    it { is_expected.to eq(0) }
  end
end
