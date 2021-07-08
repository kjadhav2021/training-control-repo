# @summary
# A profile class for the webserver machine.
#
# It installs iis server and its components.
#
# @example
#   include profile::webserver_baseline
class profile::webserver
{
  include iis_webserver
  include iis_webserver::iis_application_pool
  include iis_webserver::iis_site
}
