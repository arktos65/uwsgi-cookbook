# frozen_string_literal: true

#
# Cookbook Name:: uwsgi
# Recipe:: default
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

# uWSGI source
default['uwsgi']['version'] = '2.0.15'
default['uwsgi']['download_url'] = 'http://projects.unbit.it/downloads'
default['uwsgi']['service'] = 'uwsgi-server'

# Other configuration settings
default['uwsgi']['pcre']['enable'] = true
default['uwsgi']['emperor']['enable'] = false
default['uwsgi']['buildconf'] = "#{Chef::Config[:file_cache_path]}/uwsgi-#{node['uwsgi']['version']}/buildconf"
