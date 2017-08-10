UWSGI COOKBOOK
==============
[![Build Status](https://secure.travis-ci.org/arktos65/uwsgi-cookbook.png)](http://travis-ci.org/arktos65/uwsgi-cookbook)

uWSGI is a high performance application server framework for Python, Ruby, and other applications.  This cookbook
compiles from source a modular installation of uWSGI.  Using this approach allows for a tailored installation using
wrapper cookbooks.

The Debian configure recipe is somewhat reverse engineered from the uwsgi apt package, but set up in such a way to
allow flexible configuration.

## Supported Platforms

Supported platforms:  Ubuntu Server 14.04, 16.04

License & Authors
-----------------
- Author:: Sean M. Sullivan (<sean@pulselocker.com>)

```text
Copyright:: 2014-2017 Pulselocker, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```