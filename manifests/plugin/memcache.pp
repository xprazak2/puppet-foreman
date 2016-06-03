# = Foreman Memcache plugin
#
# This class installs the memcache plugin and configuration file
#
# === Parameters:
#
# $hosts::      an array of hosts running memcache
#               type:array
#
# $expires_in:: global default for key TTL in seconds
#               type:integer
#
# $namespace::  prepends each key with this value to provide simple namespacing
#               type:string
#
# $compress::   will gzip-compress values larger than 1K
#               type:boolean
#
class foreman::plugin::memcache (
  $hosts      = $::foreman::plugin::memcache::params::hosts,
  $expires_in = $::foreman::plugin::memcache::params::expires_in,
  $namespace  = $::foreman::plugin::memcache::params::namespace,
  $compress   = $::foreman::plugin::memcache::params::compress,
) inherits foreman::plugin::memcache::params {

  validate_array($hosts)
  validate_bool($compress)
  validate_integer($expires_in)
  validate_string($namespace)

  foreman::plugin {'memcache':
    config => template('foreman/foreman_memcache.yaml.erb'),
  }
}
