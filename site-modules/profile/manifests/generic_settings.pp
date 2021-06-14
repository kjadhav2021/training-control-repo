# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::generic_settings
class profile::generic_settings (
  Hash $settings,
  ){
  $settings.each | $setting | {
    registry_value { $setting[1]['title'] :
      ensure => 'present',
      path   => $setting[1]['path'],
      type   => 'dword',
      data   => $setting[1]['datavalue'],
    }
  }
}
