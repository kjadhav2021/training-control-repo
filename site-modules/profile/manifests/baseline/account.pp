# @summary
# A profile class for the baseline account for server machine.
#
# It creates local accounts for users based on values provided in the data file common.yaml.
# Also, it enables logon as a service for user id.
#
# @example
#   include profile::baseline::account
class profile::baseline::account (
  String $full_name          = 'Art vandelay',
  String $user_name          = 'vandelay',
  String $groups             = 'BUILTIN\Administrators',
  String $comment            = 'Vandelay Industries Administrator - managed by Puppet',
  String $logon_policy_value = 'vandelay,*S-1-5-80-0',
){
  $logon_policy = 'Log on as a service'
  $default_password = 'Puppetlabs123!'
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
