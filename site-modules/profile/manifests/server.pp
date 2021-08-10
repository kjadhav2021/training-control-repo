# @summary
# A profile class for the baselines for server machine.
#
# @example
#   include profile::server
class profile::server (
  Array[String] $baselines = ['account', 'dir_permissions', 'ieesc', 'shutdown_tracker', 'packages'],
) {
  $baselines.each |$baseline| {
    include("profile::baseline::${baseline}")
  }
}
