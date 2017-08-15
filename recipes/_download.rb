# frozen_string_literal: true

#
# Cookbook Name:: uwsgi
# Recipe:: _download
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
# Recipe to download and extract the source code
###
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