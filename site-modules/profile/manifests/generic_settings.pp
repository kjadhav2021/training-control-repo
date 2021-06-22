# @summary
# A profile class for the user machine.
#
# It enforces the default settings using registry configuration for user machines.
# The default settings include IEESC configuration and enabling shutdown event tracker.
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
