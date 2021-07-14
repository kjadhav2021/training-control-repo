# @summary
# A profile class for the baseline packages for server machine.
#
# @example
#   include profile::baseline::packages
#
# @param packages
#   it is String array of package names to download on machine.
class profile::baseline::packages (
  Array[String] $packages = ['mobaxterm', 'sevenzip', 'chrome'],
) {
  #  declaring the baseline packages
  $packages.each |$package| {
    include("profile::baseline::${package}")
  }
}
