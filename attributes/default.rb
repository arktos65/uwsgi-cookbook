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

default['uwsgi']['version'] = "1.9.19"
default['uwsgi']['download_url'] = "http://projects.unbit.it/downloads"
default['uwsgi']['ssl_port'] = 443
default['uwsgi']['install_dir'] = "/opt/installs"
default['uwsgi']['config_dir'] = "/etc/uwsgi"
default['uwsgi']['apps_available_dir'] = "/etc/uwsgi/apps-available"
default['uwsgi']['apps_enabled_dir'] = "/etc/uwsgi/apps-enabled"
default['uwsgi']['log_dir'] = "/var/log/uwsgi"
default['uwsgi']['build_directives'] = "pulselocker.ini"