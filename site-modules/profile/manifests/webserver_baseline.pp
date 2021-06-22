# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::webserver_baseline
class profile::webserver_baseline
{
  include iis_webserver
  include iis_webserver::iis_application_pool
  include iis_webserver::iis_site
}
