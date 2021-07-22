# @summary
# A profile class for the webserver machine.
#
# It installs iis server and its components.
#
# @example
#   include profile::webserver
class profile::webserver (
  Array[String] $web_components = [
    'webapp_manager',
    'webapp_manager::webapp_pool',
    'webapp_manager::website'
  ],
)
{
  require profile::baseline::basic_site
  $web_components.each |$component| {
    include($component)
  }
}
