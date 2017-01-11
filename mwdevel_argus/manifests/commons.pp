class mwdevel_argus::commons (
  $conf_dir          = $mwdevel_argus::params::conf_dir,
  $grid_security_dir = $mwdevel_argus::params::grid_security_dir,
  $trust_info_dir    = $mwdevel_argus::params::trust_info_dir,) inherits mwdevel_argus::params {
  #
  case $lsbmajdistrelease {
    6       : {
      $repo_file          = '/etc/yum.repos.d/argus_el6.repo'
      $repo_file_template = 'mwdevel_argus/argus_el6.repo.erb'

      $umd_repo           = 'http://repository.egi.eu/sw/production/umd/3/sl6/x86_64/base/umd-release-3.0.0-1.el6.noarch.rpm'
      $install_umd_cmd    = "yum install -y ${umd_repo}"
      $umd_repo_file      = '/etc/yum.repos.d/UMD-3-base.repo'
    }
    7       : {
      $repo_file          = '/etc/yum.repos.d/argus_el7.repo'
      $repo_file_template = 'mwdevel_argus/argus_el7.repo.erb'

      $umd_repo           = 'http://repository.egi.eu/sw/production/umd/4/centos7/x86_64/base/umd-release-4.0.0-1.el7.noarch.rpm'
      $install_umd_cmd    = "yum install -y ${umd_repo}"
      $umd_repo_file      = '/etc/yum.repos.d/UMD-4-base.repo'

    }
    default : {
      fail("Unrecognized scientific Linux major version: ${lsbmajdistrelease}")
    }
  }

  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin', }

  exec { 'umd-repo':
    command => $install_umd_cmd,
    onlyif  => "test ! -f ${umd_repo_file}",;
  }

  file {
    $conf_dir:
      ensure => directory,;

    $grid_security_dir:
      ensure => directory,;

    $trust_info_dir:
      ensure  => directory,
      require => File[$grid_security_dir],;

    'argus-repo':
      ensure  => file,
      path    => $repo_file,
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template($repo_file_template),;
  }

  package { 'epel-release': ensure => latest, }

}
