#
# Author:: Sean M. Sullivan (<sean@pulselocker.com>)
# Copyright:: Copyright (c) 2014 Pulselocker, Inc.
# License:: Apache License, Version 2.0
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

class Chef
  class Provider
    class Uwsgi
      class Application < Chef::Provider
        def load_current_resource
          @current_resource = Chef::Resource::Uwsgi.new(@new_resource.name)
          @current_resource.source(@new_resource.source)
          @current_resource
        end

        # Action: create application configuration file
        def action_create
          if application_exists?
            Chef::Log.debug("#{@new_resource} uWSGI application exists - nothing to do.")
          else
            converge_by("Creating uWSGI application: #{@new_resource}") do
              file application_file do
                owner 'root'
                group 'root'
                mode 0755
                content ::File.open(@new_resource.source).read
                action :create
              end
              Chef::Log.info("#{@new_resource} application created.")
            end
          end
        end

        # Action: delete application configuration file
        def action_delete
          if application_exists?
            if application_enabled?
              converge_by("Disabling uWSGI application: #{@new_resource}") do
                disable
              end
            end
            converge_by("Deleting uWSGI application: #{@new_resource}") do
              file application_file do
                action :delete
              end
              Chef::Log.info("#{@new_resource} application deleted.")
            end
          else
            Chef::Log.debug("#{@new_resource} uWSGU application does not exist - nothing to do.")
          end
        end
      end

      # Action: Enable application
      def action_enable
        if application_enabled?
          Chef::Log.debug("#{@new_resource} uWSGI application already enabled - nothing to do.")
        else
          enable_app
        end
      end

      # Action: Disable application
      def action_disable
        if application_enabled?
          disable_app
        else
          Chef::Log.debug("#{@new_resource} application already disabled - nothing to do.")
        end
      end

      # Check to see if application configuration file exists
      def application_exists?
        path = node['uwsgi']['config']['directories']['apps_available']
        return Chef::Provider::File.exist?("#{path}/#{@new_resource.name}")
      end

      # Check to see if application configuration symlink exists
      def application_enabled?
        path = node['uwsgi']['config']['directories']['apps_enabled']
        return Chef::Provider::File.symlink?("#{path}/#{@new_resource.name}")
      end

      # Returns full path of application configuration file
      def application_file
        path = node['uwsgi']['config']['directories']['apps_available']
        return "#{path}/#{@current_resource.name}"
      end

      # Returns full path of application configuration symlink
      def application_link
        path = node['uwsgi']['config']['directories']['apps_enabled']
        return "#{path}/#{@current_resource.name}"
      end

      private

      # Disable application
      def disable_app
        converge_by("Disabling uWSGI application: #{@new_resource}") do
          link application_link do
            to application_file
            action :delete
          end
        end
      end

      # Enable application
      def enable_app
        converge_by("Enabling uWSGI application: #{@new_resource}") do
          link application_link do
            to application_file
            action :create
          end
          Chef::Log.info("#{@new_resource} application enabled.")
        end
      end
    end
  end
end

