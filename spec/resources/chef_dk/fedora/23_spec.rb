# encoding: utf-8
# frozen_string_literal: true

require_relative '../../chef_dk'

describe 'resources::chef_dk::fedora::23' do
  include_context 'resources::chef_dk'

  let(:platform) { 'fedora' }
  let(:platform_version) { '23' }

  it_behaves_like 'any platform'
end
