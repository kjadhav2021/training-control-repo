# @summary
# A profile class for the baseline settings for server machine.
#
# It enforces the default settings using registry configuration for user machines.
# The default settings includes enabling shutdown event tracker.
#
# @example
#   include profile::baseline::shutdown_tracker
#
# @param enable
#   It ensures as a boolean value such as true.
class profile::baseline::shutdown_tracker (
  Enum['disable','enable'] $status = 'enable',
) {
  # checking boolean variable disable to assign value for $policy_value variable
  if $status == 'enable' {
    $policy_value = '0x00000001'
  } else {
    $policy_value = '0x00000000'
  }
  # setting up registry value to enable shutdown event tracker
  registry_value { 'enable shutdown event tracker':
    ensure => 'present',
    type   => 'dword',
    path   => 'HKLM\Software\Microsoft\Windows\CurrentVersion\Reliability\ShutdownReasonOn',
    data   => $policy_value,
  }
  # setting up registry value to display shutdown event tracker ui
  registry_value { 'display shutdown event tracker ui':
    ensure => 'present',
    type   => 'dword',
    path   => 'HKLM\Software\Microsoft\Windows\CurrentVersion\Reliability\ShutdownReasonUI',
    data   => $policy_value,
  }
}
