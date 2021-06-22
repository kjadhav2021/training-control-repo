# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::install_tpp_archive
class profile::install_tpp_archive (
  String $extract_path,
  Hash $archivesettings,
){
    file { $extract_path:
      ensure => 'directory',
      path   => $extract_path,
    }
    $archivesettings.each | $k,$d | {
      if $d['extract'] {
        archive { $d['title']:
          source        => $d['source'],
          extract       => $d['extract'],
          extract_path  => $extract_path,
          path          => "${extract_path}/${d['title']}",
          checksum      => $d['sha_checksum'],
          checksum_type => 'sha256',
          cleanup       => true,
        }
      }
      else {
        Package { $d['title']:
            ensure   => 'installed',
            provider => 'windows',
            source   => "${extract_path}/${d['title']}",
            require  => Archive[$d['dependent_class']],
        }
      }
    }
}
