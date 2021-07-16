# @summary
# A profile class for the webserver machine.
#
# It installs iis server and its components.
#
# @example
#   include profile::webserver
class profile::webserver (
  Array[String] $web_components = [
    'iis_webserver',
    'iis_webserver::iis_application_pool',
    'iis_webserver::iis_site'
  ],
)
{
  $web_components.each |$component| {
    include($component)
  }
}
