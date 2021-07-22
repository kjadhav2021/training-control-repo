# @summary
# A profile class for the baselines for server machine.
#
# @example
#   include profile::server
class profile::server (
  Array[String] $baseline = ['account', 'dir_permissions', 'ieesc', 'shutdown_tracker', 'packages'],
) {
  $baseline.each |$baseline| {
    include("profile::baseline::${baseline}")
  }
}
