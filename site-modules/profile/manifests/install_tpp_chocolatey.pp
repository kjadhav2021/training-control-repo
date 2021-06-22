# @summary
# A profile class for the user machine.
#
# It installs 7zip and notepad plus plus on user machines using chocolatey repo.
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
