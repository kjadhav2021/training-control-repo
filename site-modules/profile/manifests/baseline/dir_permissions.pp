# @summary
# A profile class for the setting directory permissions for admin script directory.
#
# It provides directory rights for given admin script directory path and local account
# using ACL module from forge.
# @example
# include profile::baseline::dir_permissions
class profile::baseline::dir_permissions (
  String $admin_dir     = 'C:/adminTools',
  Hash $dir_permissions = {
  'adminTools'  => {
  'target'      => 'C:/adminTools',
  'permissions' => [
    {'identity' => 'vandelay', 'rights'      => ['full'], 'perm_type'           => 'allow'},
    {'identity' => 'administrators','rights' => ['read','execute'], 'perm_type' => 'allow'},
    {'identity' => 'everyone','rights'       => ['full'], 'perm_type'           => 'deny'}]
    }
  }
){
  # create admin script: adminTools directory
  file { $admin_dir:
      ensure => 'directory',
      path   => $admin_dir,
  }
  # providing directory rights to admin script directory
  create_resources( acl ,$dir_permissions )
}
