# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::accounts_baseline
class profile::accounts_baseline (
  Hash $users ,
  String $local_policy ,
  String $policy_value ,
){
  $users.each | $user | {
    user { $user[1]['title']:
      ensure     => present,
      name       => $user[1]['name'],
      groups     => [$user[1]['groups']],
      comment    => $user[1]['comment'],
      password   => 'Puppetlabs123!',
      managehome => true,
    }
  }
  # granting user art vandelay the "Log on as a service" right
  local_security_policy { $local_policy:
    ensure       => present,
    policy_value => $policy_value,
  }
  # creating admin script directory
  file { 'c:/adminTools':
    ensure => 'directory',
    # type   => 'directory',
    # mode   => '0660',
    owner  => 'vandelay',
    group  => 'Administrators',
    path   => 'c:/adminTools',
  }


}
