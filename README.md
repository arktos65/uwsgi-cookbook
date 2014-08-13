UWSGI COOKBOOK
==============

uWSGI is a high performance application server framework for Python, Ruby, and other applications.  This cookbook
compiles from source a modular installation of uWSGI.  Using this approach allows for a tailored installation using
wrapper cookbooks.

## Supported Platforms

Supported platforms:  Ubuntu 12.04, 14.04.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['uwsgi']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### uwsgi::default

Include `uwsgi` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[uwsgi::default]"
  ]
}
```

## License and Authors

Author:: Sean M. Sullivan (<sean@pulselocker.com>) - Pulselocker, Inc.

