# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include role::workstation
class role::workstation {
  include profile::accounts_baseline
  include profile::generic_settings
  include profile::install_tpp_archive
  include profile::install_tpp_chocolatey
}
