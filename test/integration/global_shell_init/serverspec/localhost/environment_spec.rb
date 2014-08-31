# Encoding: UTF-8
#
# Cookbook Name:: chef-dk
# Spec:: serverspec/localhost/environment
#
# Copyright (C) 2014, Jonathan Hartman
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'spec_helper'

describe 'Chef-DK environment' do
  let(:bashrc_file) do
    case os[:family]
    when 'Darwin', 'RedHat'
      '/etc/bashrc'
    when 'Ubuntu'
      '/etc/bash.bashrc'
    else
      nil
    end
  end

  describe 'bashrc file' do
    it 'contains the chef shell-init command' do
      matcher = /^eval "\$\(chef shell-init bash\)"$/
      expect(file(bashrc_file).content).to match(matcher)
    end
  end
end