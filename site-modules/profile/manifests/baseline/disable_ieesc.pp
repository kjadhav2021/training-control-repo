# @summary
# A profile class for the baseline settings for server machine.
#
# It enforces the default settings using registry configuration for user machines.
# The default settings for disabling IEESC configuration.
#
# @example
#   include profile::baseline::disable_ieesc
class profile::baseline::disable_ieesc (
  String $admin_title   = 'disable IEESC for admin',
  String $admin_setting = '{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled',
  String $user_title    = 'disable IEESC for user',
  String $user_setting  = '{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled',
  String $disable       = '0x00000000',
){
  # setting up registry value to enable shutdown event tracker
  registry_value { $admin_title:
    ensure => 'present',
    type   => 'dword',
    path   => "HKLM\Software\Microsoft\Active Setup\Installed Components\"${admin_setting}",
    data   => $disable,
  }
  # setting up registry value to display shutdown event tracker ui
  registry_value { $user_title:
    ensure => 'present',
    type   => 'dword',
    path   => "HKLM\Software\Microsoft\Active Setup\Installed Components\"${user_setting}",
    data   => $disable,
  }
}
