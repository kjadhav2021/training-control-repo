#a sample class for presenting the scope use for resources
class scope_example {
  File { ensure => directory, }
  file {'/tmp/example':}
}
