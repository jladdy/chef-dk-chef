# Encoding: UTF-8

require_relative '../spec_helper'
require_relative '../../libraries/provider_chef_dk_debian'

describe Chef::Provider::ChefDk::Debian do
  let(:name) { 'default' }
  let(:run_context) { ChefSpec::SoloRunner.new.converge.run_context }
  let(:new_resource) { Chef::Resource::ChefDk.new(name, run_context) }
  let(:provider) { described_class.new(new_resource, run_context) }

  describe '.provides?' do
    let(:platform) { nil }
    let(:node) { ChefSpec::Macros.stub_node('node.example', platform) }
    let(:res) { described_class.provides?(node, new_resource) }

    context 'Debian' do
      let(:platform) { { platform: 'debian', version: '7.6' } }

      it 'returns true' do
        expect(res).to eq(true)
      end
    end

    context 'Ubuntu' do
      let(:platform) { { platform: 'ubuntu', version: '14.04' } }

      it 'returns true' do
        expect(res).to eq(true)
      end
    end
  end

  describe '#package_provider_class' do
    it 'returns Chef::Provider::Package::Dpkg' do
      expected = Chef::Provider::Package::Dpkg
      expect(provider.send(:package_provider_class)).to eq(expected)
    end
  end

  describe '#bashrc_file' do
    it 'returns "bash.bashrc"' do
      expect(provider.send(:bashrc_file)).to eq('/etc/bash.bashrc')
    end
  end
end
