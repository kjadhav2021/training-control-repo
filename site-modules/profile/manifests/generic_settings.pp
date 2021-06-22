# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::generic_settings
class profile::generic_settings (
  Hash $settings,
  ){
  $settings.each | $k,$d | {
    registry_value { $d['title'] :
      ensure => 'present',
      path   => $d['path'],
      type   => 'dword',
      data   => $d['datavalue'],
    }
  }
}
