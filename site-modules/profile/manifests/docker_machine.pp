# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::docker_machine
class profile::docker_machine {
  # include 'docker'
  class { 'docker':
    docker_ee                   => false,
    use_upstream_package_source => false,
    service_overrides_template  => false,
    repo_opt                    => '',
  }
}
