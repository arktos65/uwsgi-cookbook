UWSGI COOKBOOK CHANGELOG
========================

1.1.2 (2015-11-16)
------------------
- Correct attributes & allow logrotate to process file.

1.1.1 (2015-06-25)
------------------
- Installs libpcre3 and libpcre3-dev packages on Debian flavored distributions.
- Changed build_uwsgi_moduler.ini file to support PCRE and internal routing by default for modular build.

1.1.0
-----
- Includes support for Emperor server configuration.  Set `node['uwsgi']['emperor']['enable']` to true.
- Deprecated Test Kitchen suite for Ubuntu 12.04.

1.0.3
-----
- Improvements to the packaging of uWSGI plugins.

1.0.2
-----
- Enable `rsyslog` plugin support in default configuration.
- Default uWSGI core build is now `v2.0.9`.

1.0.1
-----
- Added Travis CI testing support.

1.0.0
-----
- Version bump for production release.

0.2.0
-----
- Added LWRP for uWSGI application management.

0.1.1
-----
- Package dependencies added.

0.1.0
-----
- Initial development release of uWSGI cookbook.
- Builds core binary and installs in runtime directory (default /usr/local/bin/uwsgi).

