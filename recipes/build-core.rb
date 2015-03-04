#
# Cookbook Name:: uwsgi
# Recipe:: build-core
#
# Copyright 2014, Pulselocker, Inc.
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

###
# Recipe to build the uWSGI core from source
###

include_recipe "uwsgi::_download"

directory node['uwsgi']['core']['directory'] do
  owner "root"
  group "root"
  mode 00755
  action :create
end

# Load the build template for the uWSGI core
template "#{Chef::Config[:file_cache_path]}/uwsgi-#{node['uwsgi']['version']}/buildconf/uwsgi_modular.ini" do
  source "build_uwsgi_modular.ini.erb"
  owner "root"
  group "root"
  mode 0755
  action :create
end

# Compile the uWSGI core binary
bash "build_uwsgi_#{node['uwsgi']['version']}_core" do
  cwd "#{Chef::Config[:file_cache_path]}/uwsgi-#{node['uwsgi']['version']}"
  code <<-EOH
    python uwsgiconfig.py --build uwsgi_modular
  EOH
end

bash "installing_uwsgi_#{node['uwsgi']['version']}_core_binary" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
  cp -fv uwsgi-#{node['uwsgi']['version']}/uwsgi #{node['uwsgi']['core']['directory']}/#{node['uwsgi']['core']['binary']}
  chown root:root #{node['uwsgi']['core']['directory']}/#{node['uwsgi']['core']['binary']}
  chmod 0755 #{node['uwsgi']['core']['directory']}/#{node['uwsgi']['core']['binary']}
  EOH
end