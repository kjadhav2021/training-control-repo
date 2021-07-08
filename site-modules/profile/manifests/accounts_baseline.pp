# @summary
# A profile class for the accounts baseline for user machine.
#
# It creates local accounts for users based on values provided in the data file common.yaml.
# Also, it enables logon as a service for user id.
#
# It provides directory rights for given admin script directory path and local account
# using ACL module from forge.
# @example
#   include profile::accounts_baseline
class profile::accounts_baseline (
  String $full_name    = 'Art vandelay',
  String $username     = 'vandelay',
  String $groups       = 'BUILTIN\Administrators',
  String $comment      = 'Vandelay Industries Administrator - managed by Puppet',
  String $logon_policy = 'Log on as a service',
  String $policy_value = 'vandelay,george,*S-1-5-80-0',
){
  # creating user art vandelay
  user { $full_name:
    ensure     => present,
    name       => $username,
    groups     => [$groups],
    comment    => $comment,
    password   => 'Puppetlabs123!',
    managehome => true,
  }
  # granting user art vandelay the "Log on as a service" right
  local_security_policy { $logon_policy:
    ensure       => present,
    policy_value => $policy_value,
  }
}
