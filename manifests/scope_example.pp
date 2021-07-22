#a sample class for presenting the scope use for resources
class scope_example {
  # file resource to created directory
  file { 'c:/tmpbasic4':
    ensure => directory,
  }
  #file resource to create file example
  file { 'c:/tmpbasic4/example':
  }
}
