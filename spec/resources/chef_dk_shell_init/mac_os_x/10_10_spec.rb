require_relative '../mac_os_x'

describe 'resources::chef_dk_shell_init::mac_os_x::10_10' do
  include_context 'resources::chef_dk_shell_init::mac_os_x'

  let(:platform) { 'mac_os_x' }
  let(:platform_version) { '10.10' }

  it_behaves_like 'any Mac OS X platform'
end
