# Puppet module for Atlassian SDK installation
[![Build Status](https://travis-ci.org/Adaptavist/puppet-atlassian_sdk.svg?branch=master)](https://travis-ci.org/Adaptavist/puppet-atlassian_sdk)

* Allows installation of multiple versions of Atlassian SDK
* You can configure the owner/group for the extracted SDK files

# Example

```
class { 'atlassian_sdk':
  versions   => ['4.2.20', '5.0.3'],
  user       => "hosting",   # the default value
  group      => "hosting",   # the default value
  installdir => "/opt"       # the default value
}
```