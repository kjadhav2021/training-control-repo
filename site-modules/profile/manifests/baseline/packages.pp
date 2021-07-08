# @summary
# A profile class for the baseline packages for server machine.
#
# @example
#   include profile::baseline::packages
class profile::baseline::packages (
  Array[String] $packages = ['mobaxterm', 'sevenzip'],
){
  #  declaring the baseline packages
  $packages.each | $package | {
    include("profile::baseline::${package}")
  }
}
