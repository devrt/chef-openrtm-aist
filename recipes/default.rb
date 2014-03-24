#
# Cookbook Name:: openrtm-aist
# Recipe:: default
#
# Copyright 2014, Yosuke Matsusaka
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'build-essential'
include_recipe 'subversion::client'
include_recipe 'python'
include_recipe 'omniorb'

pkgs = value_for_platform_family(
  ['debian'] => %w(libtool uuid-dev libboost-dev libboost-system-dev libboost-filesystem-dev libyaml-dev)
)

pkgs.each do |pkg|
  package pkg do
    action :install
  end
end

python_pip 'PyYaml'

bash 'compile_openrtm-aist' do
  cwd "#{Chef::Config['file_cache_path']}/OpenRTM-aist"
  code <<-EOH
      ./build/autogen
      ./configure --without-doxygen
      make clean && make && make install
      ldconfig
  EOH
  action :nothing
end

subversion 'OpenRTM-aist' do
  repository 'http://svn.openrtm.org/OpenRTM-aist/branches/RELENG_1_1/OpenRTM-aist/'
  revision 'HEAD'
  destination "#{Chef::Config[:file_cache_path]}/OpenRTM-aist"
  action :sync
  notifies :run, 'bash[compile_openrtm-aist]', :immediately
end
