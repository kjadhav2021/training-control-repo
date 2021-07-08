# @summary
# A profile class for installing mobaxterm for server machine.
#
# It uses archive resource to download zip file from internet and extract it at extract path.
# After file extraction, It installs Mobaxterm.msi package using windows provider.
#
# @example
#   include profile::baseline::mobaxterm
class profile::baseline::mobaxterm (
  String $extract_path = 'C:/tmppackage',
  String $zip_source = 'https://download.mobatek.net/2122021051924233/MobaXterm_Installer_v21.2.zip',
  String $msi_name = 'MobaXterm_installer_21.2.msi',
  String $checksum = '4cdd6069d216923b9458b5298ca071b159d4eb272294bd46d1fce0b1d890cd6a',
  String $checksum_type = 'sha256',
){
  # create extract path 'C:/tmppackage' directory on server machine
  file { $extract_path:
    ensure => 'directory',
    path   => $extract_path,
  }
  # download mobaxterm.zip file and extract it in provided extract path
  archive { 'MobaXterm.zip':
    source        => $zip_source,
    extract       => true,
    extract_path  => $extract_path,
    path          => "${extract_path}/mobaxterm.zip",
    checksum      => $checksum,
    checksum_type => 'sha256',
    cleanup       => true,
  }
  # install Mobaxterm.msi module using package resource
  package { 'MobaXterm.msi':
    ensure   => 'installed',
    provider => 'windows',
    source   => "${extract_path}/${msi_name}",
    require  => Archive['MobaXterm.zip'],
  }
}
