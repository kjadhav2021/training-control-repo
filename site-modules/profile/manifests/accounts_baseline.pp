# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::accounts_baseline
class profile::accounts_baseline (
  Hash $users ,
  Hash $local_policy ,
  Hash $dir_permissions ,
){
  $users.each | $k,$d | {
    user { $d['title']:
      ensure     => present,
      name       => $d['name'],
      groups     => [$d['groups']],
      comment    => $d['comment'],
      password   => 'Puppetlabs123!',
      managehome => true,
    }
  }
  # granting user art vandelay the "Log on as a service" right
  $local_policy.each | $k,$d | {
    local_security_policy { $d['title']:
      ensure       => present,
      policy_value => $d['policy_value'],
    }
  }
  # creating admin script directory
  $dir_permissions.each | $permission | {
    file { $permission[1]['target']:
      ensure => 'directory',
      path   => $permission[1]['target'],
    }
    $aclmap =lookup('profile::accounts_baseline::dir_permissions')
    create_resources( acl ,$aclmap )
  }
}
