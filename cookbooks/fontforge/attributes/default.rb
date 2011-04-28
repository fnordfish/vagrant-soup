#
# Cookbook Name:: fontforge
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
default['fontforge']['install_method'] = 'source'
default['fontforge']['prefix_dir'] = '/usr/local'

# build python bindings?
default['fontforge']['with_python'] = false

# build with system-iconv? if not, use fontforge's iconv
default['fontforge']['with_iconv'] = false

default['fontforge']['url'] = 'git://fontforge.git.sourceforge.net/gitroot/fontforge/fontforge'

default['fontforge']['freetype_url'] = 'http://download.savannah.gnu.org/releases/freetype/freetype-2.4.4.tar.bz2'
default['fontforge']['freetype_source_dir'] = File.basename(default['fontforge']['freetype_url']).gsub(/\.tar(\.bz2|\.gz)?$/, '')

default['fontforge']['configure_options'] = %W{
  --prefix=#{fontforge['prefix_dir']}
  --without-x
  --enable-type3
  --enable-devicetables
  #{fontforge['with_python'] ? '' : '--without-python'}
  #{fontforge['with_iconv'] ? '' : '--without-python'}
  --with-freetype-src=#{fontforge['freetype_source_dir'] =~ /^\// ? fontforge['freetype_source_dir'] : '../'+fontforge['freetype_source_dir']}
}