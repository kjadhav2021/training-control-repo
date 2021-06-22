# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::install_tpp_chocolatey
class profile::install_tpp_chocolatey
(
  Hash $tpp,
){
  #  install and configure Chocolatey
  include chocolatey

  $tpp.each | $k,$d | {
    package { $d['package_name']:
      ensure   => installed,
      provider => 'chocolatey',
    }
    if $d['reboot_machine'] {
      reboot { 'after':
        provider  => 'windows',
        subscribe => Package[$d['package_name']],
      }
    }
  }
}
