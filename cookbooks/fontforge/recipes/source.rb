#
# Cookbook Name:: fontforge
# Recipe:: source
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
include_recipe "git"

# TODO: add support for redhat and friends
packages = value_for_platform(
  "default" => %w{libspiro0 libspiro-dev libuninameslist0 libuninameslist-dev libcairo2 libcairo2-dev libpango1.0-0 libpango1.0-dev libfreetype6 libfreetype6-dev}
)

packages.each do |pkg|
  package pkg
end

freetype_url = node['fontforge']['freetype_url']
freetype_source_dir = node['fontforge']['freetype_source_dir']

unless freetype_source_dir =~ /^\//  
  remote_file "#{Chef::Config[:file_cache_path]}/#{File.basename(freetype_url)}" do
    source freetype_url
    mode "0644"
    not_if "which fontforge"
  end
end

bash "prepare freetype" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
  tar -xvf #{File.basename(freetype_url)}
  EOF
  not_if "which fontforge"
end


configure_options = node['fontforge']['configure_options'].join(" ")

bash "fetch fontforge" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
  git clone #{node['fontforge']['url']} fontforge
  (cd fontforge && ./configure #{configure_options})
  (cd fontforge && make && make install)
  EOF
  not_if "which fontforge"
end