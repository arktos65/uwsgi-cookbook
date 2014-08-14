name             'uwsgi'
maintainer       'Pulselocker, Inc.'
maintainer_email 'sean@pulselocker.com'
license          'Apache 2.0'
description      'Installs/Configures uWSGI application server.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'uwsgi', 'Default recipe builds core, plugins, and installs runtime environment.'
recipe 'uwsgi::build-core', 'Builds the uWSGI core program.'
recipe 'uwsgi::build-plugins', 'Builds the uWSGI plugins.'
recipe 'uwsgi::configure', 'Creates and configures the runtime environment.'

depends "apt"
depends "build-essential"
depends "python"
depends "rsyslog"





