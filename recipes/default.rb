#
# Cookbook Name:: uwsgi
# Recipe:: default
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

# Install dependencies if necessary
if node['platform_family'] == 'debian'
  include_recipe 'apt::default'
end
include_recipe 'rsyslog'
include_recipe 'build-essential'
include_recipe 'poise-python'

# Workaround for bug in Python 2.7 apt package (Issue #16)
unless File.exists?('/usr/bin/python')
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
if node['uwsgi']['pcre']['enable'] == true
  package ['libpcre3', 'libpcre3-dev'] do
    action :install
    only_if { node['platform_family'] == 'debian' }
  end
end

# Compile the uWSGI core application
include_recipe 'uwsgi::build-core'
include_recipe 'uwsgi::build-plugins'
include_recipe 'uwsgi::configure'


