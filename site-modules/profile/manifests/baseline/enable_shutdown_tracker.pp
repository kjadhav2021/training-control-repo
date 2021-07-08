# @summary
# A profile class for the baseline settings for server machine.
#
# It enforces the default settings using registry configuration for user machines.
# The default settings includes enabling shutdown event tracker.
#
# @example
#   include profile::baseline::enable_shutdown_tracker
class profile::baseline::enable_shutdown_tracker (
  String $reason_title     = 'enable shutdown event tracker',
  String $reason_setting   = 'ShutdownReasonOn',
  String $reasonui_title   = 'display shutdown event tracker ui',
  String $reasonui_setting = 'ShutdownReasonUI',
  String $enable           = '0x00000001',
){
  # setting up registry value to enable shutdown event tracker
  registry_value { $reason_title:
    ensure => 'present',
    type   => 'dword',
    path   => "HKLM\Software\Microsoft\Windows\CurrentVersion\Reliability\"${reason_setting}",
    data   => $enable,
  }
  # setting up registry value to display shutdown event tracker ui
  registry_value { $reasonui_title:
    ensure => 'present',
    type   => 'dword',
    path   => "HKLM\Software\Microsoft\Windows\CurrentVersion\Reliability\"${reasonui_setting}",
    data   => $enable,
  }
}
