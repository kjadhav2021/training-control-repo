# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::accounts_baseline
class profile::accounts_baseline (
  Hash[String, String] $users ,
  String $local_policy ,
  String $policy_value ,
){
  $users.each | $user | {
    user{ $user['title']:
      ensure     => present,
      name       => $user['name'],
      groups     => [$user['groups']],
      comment    => $user['comment'],
      password   => 'Puppetlabs123!',
      managehome => true,
  }
  }
  local_security_policy { $local_policy:
    ensure       => present,
    policy_value => $policy_value,
  }
}
