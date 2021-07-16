# @summary
# A role class for the server role (windows based machine).
#
# it includes profile::server
#
# @example
#   include role::server
class role::server {
  # added check for operating system.
  if $facts['kernel'] == 'windows' {
    include profile::server
  }
}
