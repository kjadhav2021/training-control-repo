# @summary A short summary of the purpose of this class
# A profile class for installing google chrome for machine.
#
# @example
#   include profile::baseline::chrome
# @param package_name
#   it is package name to download from chocolatey.

class profile::baseline::chrome (
  String $package_name = 'googlechrome',
) {
  #  install google chrome using Chocolatey
  package { $package_name:
      ensure   => installed,
      provider => 'chocolatey',
  }
}
