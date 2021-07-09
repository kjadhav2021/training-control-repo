# @summary
# A profile class for installing 7zip for server machine.
#
# It installs and uses chocolatey repository for windows
# After this , It installs 7zip package using chocolatey and reboot machine as per the reboot machine boolean variable
# @example
#   include profile::baseline::sevenzip
#
# @param package_name
#   it is package name to download from chocolatey.
# @param reboot_title
#   This is title for a reboot resource.
# @param reboot_machine
#   It is a boolean variable to check whether to restart machine, It ensures as boolean values true or false
class profile::baseline::sevenzip (
  String  $package_name    = '7zip',
  String  $reboot_title    = 'after_run',
  Boolean $reboot_machine  = false,
) {
  #  install and configure Chocolatey
  include chocolatey
  #  install 7zip using Chocolatey and notify the reboot reference
  package { $package_name:
      ensure   => installed,
      provider => 'chocolatey',
  }
  #  reboot server if reboot_machine boolean variable is true.
  if $reboot_machine {
    reboot { $reboot_title:
      apply     => finished,
      subscribe => Package[$package_name],
    }
  }
}
