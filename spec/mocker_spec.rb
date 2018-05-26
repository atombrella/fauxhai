require 'spec_helper'

describe Fauxhai::Mocker do
  describe '#version' do
    let(:options) { {} }
    subject { described_class.new({github_fetching: false}.merge(options)).send(:version) }

    context 'with a platform and version' do
      let(:options) { {platform: 'chefspec', version: '0.6.1'} }
      it { is_expected.to eq '0.6.1' }
    end

    context 'with a platform and no version' do
      let(:options) { {platform: 'chefspec'} }
      it { is_expected.to eq '0.6.1' }
    end

    context 'with a platform and a blank version' do
      let(:options) { {platform: 'chefspec', version: ''} }
      it { is_expected.to eq '0.6.1' }
    end

    context 'with a platform and a partial version' do
      let(:options) { {platform: 'chefspec', version: '0.6'} }
      it { is_expected.to eq '0.6.1' }
    end

    context 'with a platform and a non-matching partial version' do
      let(:options) { {platform: 'chefspec', version: '0.7'} }
      it { is_expected.to eq '0.7' }
    end

    context 'with a Windows platform and no version' do
      let(:options) { {platform: 'windows'} }
      it { is_expected.to eq '2016' }
    end

    context 'with a Windows platform and a partial version' do
      let(:options) { {platform: 'windows', version: '2008'} }
      it { is_expected.to eq '2008R2' }
    end

    context 'with a Windows platform and an exact partial version' do
      let(:options) { {platform: 'windows', version: '8'} }
      it { is_expected.to eq '8' }
    end

    context 'with a CentOS platform and a partial version' do
      let(:options) { {platform: 'centos', version: '7.4'} }
      it { is_expected.to eq '7.4.1708' }
    end

    context 'with a platform and an invalid version' do
      let(:options) { {platform: 'chefspec', version: '99'} }
      it { is_expected.to eq '99' }
    end

    context 'with an invalid platform and an invalid version' do
      let(:options) { {platform: 'notthere', version: '99'} }
      it { is_expected.to eq '99' }
    end
  end
end
