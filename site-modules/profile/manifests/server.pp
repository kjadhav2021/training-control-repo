# @summary
# A profile class for the baselines for server machine.
#
# @example
#   include profile::server
class profile::server (
  Array[String] $baseline = ['account', 'dir_permissions', 'disable_ieesc', 'enable_shutdown_tracker', 'packages'],
) {
  $baseline.each |$baseline| {
    include("profile::baseline::${baseline}")
  }
}
