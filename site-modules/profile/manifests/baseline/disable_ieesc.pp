# @summary
# A profile class for the baseline settings for server machine.
#
# It enforces the default settings using registry configuration for user machines.
# The default settings for disabling IEESC configuration.
#
# @example
#   include profile::baseline::disable_ieesc
#
# @param disable
#   It ensures as a boolean value such as true.
class profile::baseline::disable_ieesc (
  Boolean $disable = true,
) {
  # checking boolean variable disable to assign value for $policy_value variable
  if $disable {
    $policy_value = '0x00000000'
  } else {
    $policy_value = '0x00000001'
  }
  # setting up registry value to enable shutdown event tracker
  registry_value { 'disable IEESC for admin':
    ensure => 'present',
    type   => 'dword',
    path   => 'HKLM\Software\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled',
    data   => $policy_value,
  }
  # setting up registry value to display shutdown event tracker ui
  registry_value { 'disable IEESC for user':
    ensure => 'present',
    type   => 'dword',
    path   => 'HKLM\Software\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled',
    data   => $policy_value,
  }
}
