# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::accounts_baseline
class profile::accounts_baseline (
  Hash[String, String] $users = { 'title' => 'Art Vandelay',
  'name' => 'vandelay',
  'groups' => 'BUILTIN\Administrators',
  'comment' => 'Vandelay Industries Administrator - managed by Puppet'},
  String $local_policy = 'Log on as a service',
  String $policy_value = '*S-1-5-80-0,vandelay',
){
  user{ $users['title']:
      ensure     => present,
      name       => $users['name'],
      groups     => [$users['groups']],
      comment    => $users['comment'],
      password   => 'Puppetlabs123!',
      managehome => true,
  }

  local_security_policy { $local_policy:
    ensure       => 'present',
    policy_value => $policy_value,
  }
}
