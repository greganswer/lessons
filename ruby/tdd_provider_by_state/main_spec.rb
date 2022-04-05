require 'rspec'
require 'ostruct'
require_relative './main'

RSpec.describe 'provider_by_state' do
  subject { provider_by_state(order: order, providers: providers).name }

  let(:order) { OpenStruct.new(us_state_abbr: us_state_abbr) }
  let(:us_state_abbr) { 'TX' }
  let(:west_coast_abbr) { %w[WA OR CA] }
  let(:abc_provider) { OpenStruct.new(name: 'ABC') }
  let(:road_tec_provider) { OpenStruct.new(name: 'Road-Tec') }
  let(:home_entry_provider) { OpenStruct.new(name: 'Home Entry') }

  context 'when providers only contains ABC' do
    let(:providers) { [abc_provider] }

    context 'with west coast order' do
      let(:us_state_abbr) { west_coast_abbr.sample } # Don't use random data in real specs.

      it { is_expected.to eq('ABC') }
    end

    context 'with non west coast order' do
      let(:us_state_abbr) { 'TX' }

      it { is_expected.to eq('ABC') }
    end
  end

  context 'when providers only contains Road-Tec' do
    let(:providers) { [road_tec_provider] }

    context 'with west coast order' do
      let(:us_state_abbr) { west_coast_abbr.sample } # Don't use random data in real specs.

      it { is_expected.to eq('Road-Tec') }
    end

    context 'with non west coast order' do
      let(:us_state_abbr) { 'TX' }

      it { expect { subject }.to raise_error(WrongProviderError) }
    end
  end

  context 'when providers contains ABC and Road-Tec' do
    let(:providers) { [abc_provider, road_tec_provider] }

    context 'with west coast order' do
      let(:us_state_abbr) { west_coast_abbr.sample } # Don't use random data in real specs.

      it { is_expected.to eq('Road-Tec') }
    end

    context 'with non west coast order' do
      let(:us_state_abbr) { 'TX' }

      it { is_expected.to eq('ABC') }
    end
  end

  context 'when providers contains ABC and Home Entry' do
    let(:providers) { [abc_provider, home_entry_provider, road_tec_provider] }

    # If this exception occurs, we should update the code to handle it better.
    it { expect { subject }.to raise_error(MultipleProvidersError) }
  end

  context 'with 3 providers' do
    let(:providers) { [abc_provider, road_tec_provider, home_entry_provider] }

    # If this exception occurs, we should update the code to handle it better.
    it { expect { subject }.to raise_error(MultipleProvidersError) }
  end

  # Unskip this test to demonstrate the importance of TDD.
  xcontext 'with 4 providers' do
    let(:providers) { [abc_provider, road_tec_provider, home_entry_provider, OpenStruct.new] }

    # If this exception occurs, we should update the code to handle it better.
    it { expect { subject }.to raise_error(MultipleProvidersError) }
  end

  context 'with empty providers' do
    let(:providers) { [] }

    it { expect { subject }.to raise_error(MissingProvidersError) }
  end
end
