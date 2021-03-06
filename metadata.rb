# frozen_string_literal: true

name             'uwsgi'
maintainer       'Pulselocker, Inc.'
maintainer_email 'ops@pulselocker.com'
license          'Apache-2.0'
description      'Installs/Configures uWSGI application server.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.3.5'
issues_url       'https://github.com/arktos65/uwsgi-cookbook/issues' if respond_to?(:issues_url)
source_url       'https://github.com/arktos65/uwsgi-cookbook' if respond_to?(:source_url)
supports         'ubuntu', '>= 14.04'
chef_version     '~> 12'

recipe 'uwsgi', 'Default recipe builds core, plugins, and installs runtime environment.'
recipe 'uwsgi::build_core', 'Builds the uWSGI core program.'
recipe 'uwsgi::build_plugins', 'Builds the uWSGI plugins.'
recipe 'uwsgi::configure', 'Creates and configures the runtime environment.'

depends 'apt', '~> 6.1.3'
depends 'build-essential', '~> 8.0.3'
depends 'poise-python', '~> 1.6.0'
depends 'rsyslog', '~> 5.1.0'
