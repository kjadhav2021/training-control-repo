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
  Hash $dir_permissions ,
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
  $dir_permissions.each | $permission | {
    file { $permission[1]['target']:
      ensure => 'directory',
      path   => $permission[1]['target'],
    }
    $permission[1]['permissions'].each | $identity | {
      acl { $permission[1]['target'] :
        permissions => [
          { identity  => $identity['identity'] ,
            rights    => [$identity['rights']] ,
            perm_type => $identity['type']},],
      }
    }
  }
}
