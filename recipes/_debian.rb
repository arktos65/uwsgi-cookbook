#
# Cookbook Name:: uwsgi
# Recipe:: _debian
#
# Copyright 2014, uwsgi, Inc.
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
# Recipe for Debian flavored installations
###
template "/etc/logrotate.d/uwsgi.ini" do
  source "logrotate_uwsgi.ini.erb"
  owner "root"
  group "root"
  mode 0644
  action :create
  notifies :restart, "service[rsyslog]", :delayed
end
template "#{node['uwsgi']['config']['directories']['share_conf']}/default.ini" do
  source "default.ini"
  owner "root"
  group "root"
  mode 0644
  action :create
end
template "#{node['uwsgi']['config']['directories']['share_init']}/do_command" do
  source "do_command.sh"
  owner "root"
  group "root"
  mode 0644
  action :create
end
template "#{node['uwsgi']['config']['directories']['share_init']}/snippets" do
  source "snippets.sh"
  owner "root"
  group "root"
  mode 0644
  action :create
end
template "#{node['uwsgi']['config']['directories']['share_init']}/specific_daemon" do
  source "specific_daemon.sh"
  owner "root"
  group "root"
  mode 0644
  action :create
end
template "/etc/default/uwsgi" do
  source "default_uwsgi.ini"
  owner "root"
  group "root"
  mode 0644
  action :create
end

# Set up the init script
template "/etc/init.d/uwsgi" do
  source "uwsgi.sh"
  mode 0755
  owner "root"
  group "root"
  action :create
end
service "uwsgi" do
  Chef::Provider::Service::Init::Debian
  supports :start => true, :stop => true, :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
