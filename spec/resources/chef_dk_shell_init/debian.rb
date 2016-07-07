require_relative '../chef_dk_shell_init'

shared_context 'resources::chef_dk_shell_init::debian' do
  include_context 'resources::chef_dk_shell_init'

  shared_examples_for 'any Debian platform' do
    let(:root_bashrc) { '/etc/bash.bashrc' }
    let(:user_bashrc) { '/home/fauxhai/.bashrc' }

    it_behaves_like 'any supported platform'
  end
end
