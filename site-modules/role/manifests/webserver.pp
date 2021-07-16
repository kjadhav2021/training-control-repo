# @summary
# A role class for the webserver role (windows based machine).
#
# it includes profile::webserver
#
# @example
#   include role::webserver
class role::webserver {
  # added check for operating system.
  if $facts['kernel'] == 'windows' {
    include profile::webserver
  }
}
