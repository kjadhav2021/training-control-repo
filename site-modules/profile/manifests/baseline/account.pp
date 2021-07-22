# @summary
# A profile class for the baseline account for server machine.
#
# It creates local accounts for users based on values provided in the data file common.yaml.
# Also, it enables logon as a service for user id.
#
# @example
#   include profile::baseline::account
#
# @param full_name
#   it is full name of the user. This also ensures as a string value such as 'Art vandelay'.
# @param user_name
#   This is user_name for the user. It ensures as a string value such as 'vandelay'.
# @param groups
#   It ensures as a string value such as 'BUILTIN\Administrators'
# @param comment
#   It ensures as a string value such as 'Vandelay Industries Administrator - managed by Puppet'.
# @param logon_policy_value
#   It ensures as a string value such as 'vandelay,*S-1-5-80-0'.
class profile::baseline::account (
  String $full_name          = 'Art vandelay',
  String $user_name          = 'vandelay',
  String $groups             = 'BUILTIN\Administrators',
  String $logon_policy_value = 'vandelay,*S-1-5-80-0',
) {
  $logon_policy     = 'Log on as a service'
  $default_password = 'Puppetlabs123!'
  $comment          = 'Vandelay Industries Administrator - managed by Puppet'
  # creating user art vandelay
  user { $full_name:
    ensure     => present,
    name       => $user_name,
    groups     => [$groups],
    comment    => $comment,
    password   => $default_password,
    managehome => true,
  }
  # granting user art vandelay the "Log on as a service" right
  local_security_policy { $logon_policy:
    ensure       => present,
    policy_value => $logon_policy_value,
  }
}
