# @summary
# A profile class for the setting directory permissions for admin script directory.
#
# It provides directory rights for given admin script directory path and local account
# using ACL module from forge.
# @example
#   include profile::dir_permissions
class profile::dir_permissions (
  Hash $dir_permissions = { 'adminTools'  => [
  {'target' => 'C:/adminTools'},
  {'permissions' => [
  {'identity' => 'vandelay','rights' => ['full'], 'perm_type' => 'allow'},
  {'identity' => 'administrators','rights' => ['read','execute'], 'perm_type' => 'allow'},
  {'identity' => 'everyone','rights' => ['full'], 'perm_type' => 'deny'}]
  }]},
){
  # creating admin script directory
  $dir_permissions.each | $permission | {
    file { $permission[1]['target']:
      ensure => 'directory',
      path   => $permission[1]['target'],
    }
  }
  create_resources( acl ,$dir_permissions )
}
