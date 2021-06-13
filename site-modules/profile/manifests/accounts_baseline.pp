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
  String $admin_dir,
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
  # $dir_permissions.each | $permission | {
  #   file { $permission[1]['target']:
  #     ensure => 'directory',
  #     path   => $permission[1]['target'],
  #   }
  #   acl { $permission[1]['target'] :
  #     permissions => [
  #       $permission[1]['permissions'].each | $identity | {
  #         { identity => $identity['identity'] ,
  #         # rights     => [$identity['rights']] ,
  #         perm_type  => $identity['type']}
  #       },
  #     ],
  #   }
  # }

  # creating admin script directory
  file { $admin_dir :
    ensure => 'directory',
    owner  => 'vandelay',
    group  => 'Administrators',
    path   => $admin_dir,
  }
  acl { $admin_dir :
    target                     => $admin_dir ,
    permissions                => [
      { identity => 'vandelay', rights => ['full'], perm_type=> 'allow', child_types => 'all', affects => 'all' },
      { identity => 'administrators', rights => ['read','execute'], perm_type=> 'allow', child_types => 'all', affects => 'all' },
      { identity => 'everyone', perm_type=> 'deny'},
    ],
    owner                      => 'vandelay', #Creator_Owner specific, doesn't manage unless specified
    group                      => 'Administrators', #Creator_Group specific, doesn't manage unless specified
    inherit_parent_permissions => false,
  }
}
