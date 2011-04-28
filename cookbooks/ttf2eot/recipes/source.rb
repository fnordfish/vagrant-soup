#
# Cookbook Name:: ttf2eot
# Recipe:: default
#
# Copyright 2011, Robert Schulze
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
include_recipe "build-essential"

version = node['ttf2eot']['version']

remote_file "#{Chef::Config[:file_cache_path]}/ttf2eot-#{version}.tar.gz" do
  source "#{node['ttf2eot']['url']}/ttf2eot-#{version}.tar.gz"
  mode "0644"
  not_if "which ttf2eot"
end

bash "build ttf2eot" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
  tar -xvzf ttf2eot-#{version}.tar.gz
  (cd ttf2eot-#{version} && make && cp ttf2eot #{node['ttf2eot']['prefix_dir']}/bin/ttf2eot)
  EOF
  not_if "which ttf2eot"
end

file "#{node['ttf2eot']['prefix_dir']}/bin/ttf2eot" do
  owner "root"
  group "root"
  mode "0755"
end
