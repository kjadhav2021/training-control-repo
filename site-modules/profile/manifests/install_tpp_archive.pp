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
    $archivesettings.each | $k,$d | {
      if $d['extract'] {
        archive { $d['title']:
          ensure        => present,
          extract       => $d['extract'],
          extract_path  => $extract_path,
          source        => $d['source'],
          checksum      => $d['sha_checksum'],
          checksum_type => 'sha256',
          creates       => $extract_path,
        }
      }
      else {
        archive { $d['title']:
          source        => $d['source'],
          checksum      => $d['sha_checksum'],
          checksum_type => 'sha256',
          provider      => 'windows',
          require       => Archive[$d['dependent_class']],
        }
      }
    }
}
