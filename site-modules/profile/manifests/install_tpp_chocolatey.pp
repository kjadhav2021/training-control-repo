# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::install_tpp_chocolatey
class profile::install_tpp_chocolatey
(
  Hash $tpp,
  String $reboot_machine,
){
  #  install and configure Chocolatey
  include chocolatey

  $tpp.each | $k,$d | {
    package { $d['package_name']:
      ensure   => installed,
      provider => 'chocolatey',
      notify   => Reboot[$d['reboot_title']],
    }
  }
  if $reboot_machine {
    reboot { 'after run':
      apply  => finished,
    }
  }
}
