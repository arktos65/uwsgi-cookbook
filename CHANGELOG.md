UWSGI COOKBOOK CHANGELOG
========================

1.3.1 (2017-08-10)
------------------
- Fixed license metadata to satisfy Foodcritic.
- [RESOLVED] Python command missing on Ubuntu 16.04 test #16
- Default core build is now uWSGI 2.0.15.
- Updated Travis test harness.

1.3.0 (2017-08-09)
------------------
- Deprecated `python` cookbook in favor of `poise-python`.
- Refactor `metadata.rb` for correct cookbook dependencies.
- Pinned cookbook to support Chef 12.
- Added testing framework.

1.2.1 (2017-02-08)
------------------
- Fixed issue #13 where service fails to start with `$ service uwsgi start` command.
- Modified many file permissions from 0755 to 0644 for improved security.

1.2.0 (2017-01-10)
------------------
- Added Ubuntu 16.04 to Test Kitchen.
- Bumped `rsyslog` cookbook version.
- Bumped `build-essential` cookbook version.
- Bumped `uwsgi` source version from 2.0.9 to 2.0.14.

1.1.3 (2016-03-15)
------------------
- Updated Travis configuration to support Ruby 2.2.1.
- Modified Rakefile to require Ruby 2.2.1 or higher for foodcritic.
- Changed package directive in default recipe per `foodcritic` recommendation.
- Updated `metadata.rb` to comply with Chef 11/12 compatibility per `foodcritic`.

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

