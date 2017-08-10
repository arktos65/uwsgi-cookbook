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

require 'chef/resource'

# TODO: Uwsgi::Application resource documentation
class Chef
  class Resource
    class Uwsgi < Chef::Resource

      def initialize(name, run_context=nil)
        super
        @resource_name = :source
        @target_name = name
        @allowed_actions.push(:create, :delete, :enable, :disable)
        @action = :create
      end

      def whyrun_supported?
        true
      end

      def source(arg=nil)
        set_or_return(
            :source,
            arg,
            :kind_of => String,
            :required => true
        )
      end
    end
  end
end