# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::baseline::basic_site
class profile::baseline::basic_site (
  String $site_title     = 'basic',
  String $site_directory = 'C:\\inetpub\\basic',
  String $tmp_directory  = 'C:\\tmppackage',
  String $archive_title  = 'index.zip',
  String $archive_src    = 'https://gist.github.com/dylanratcliffe/af0e24303d241b888152bd1cd7c9063d/archive/ad273bebc01c6dac176da7a5f3c38c4d9a584521.zip',
  String $file_title     = 'index.html',
  String $index_file_src = 'C:\\tmppackage\\af0e24303d241b888152bd1cd7c9063d-ad273bebc01c6dac176da7a5f3c38c4d9a584521\\index.html',
  # String $site_app_pool  = 'basic_site_app_pool',
) {
  file { $site_title:
    ensure => 'directory',
    path   => $site_directory,
    before => File[$tmp_directory],
  }
  file { $tmp_directory:
    ensure => 'directory',
    path   => $tmp_directory,
    before => Archive[$archive_title],
  }
  archive { $archive_title:
    path         => "${tmp_directory}\\${archive_title}",
    source       => $archive_src,
    extract      => true,
    extract_path => $tmp_directory, #directory inside tgz
    cleanup      => true,
  }
  file { $file_title:
    ensure  => 'file',
    path    => "${site_directory}\\${file_title}",
    source  => $index_file_src,
    require => Archive[$archive_title],
  }
}
