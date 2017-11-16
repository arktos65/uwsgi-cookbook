# frozen_string_literal: true

#
# Cookbook Name:: uwsgi
# Recipe:: _prepare
#
# Copyright 2014-2017, Pulselocker, Inc.
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
# Prepare the environment for installation
###

if node['platform_family'] == 'debian'
  node.override['apt']['compile_time_update'] = true
  include_recipe 'apt'
end
include_recipe 'rsyslog'
include_recipe 'build-essential'
include_recipe 'poise-python'

# Workaround for bug in Python 2.7 apt package (Issue #16)
unless File.exist?('/usr/bin/python')
  link '/usr/bin/python' do
    to '/usr/bin/python2.7'
    owner 'root'
    group 'root'
  end
  link '/usr/bin/python2' do
    to '/usr/bin/python2.7'
    owner 'root'
    group 'root'
  end
end

# Add other dependencies
if node['platform_family'] == 'debian' && node['uwsgi']['pcre']['enable']
  package 'libpcre3' do
    action :install
  end
  package 'libpcre3-dev' do
    action :install
  end
end

# Download the source code
remote_file "#{Chef::Config[:file_cache_path]}/uwsgi-#{node['uwsgi']['version']}.tar.gz" do
  source "#{node['uwsgi']['download_url']}/uwsgi-#{node['uwsgi']['version']}.tar.gz"
  action :create_if_missing
end

bash "extract_uwsgi_#{node['uwsgi']['version']}_source" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    tar -zxvf uwsgi-#{node['uwsgi']['version']}.tar.gz
  EOH
end

directory node['uwsgi']['buildconf'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# Create directories for uWSGI binaries
directory node['uwsgi']['core']['directory'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
directory node['uwsgi']['plugins']['root'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
directory node['uwsgi']['plugins']['directory'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
