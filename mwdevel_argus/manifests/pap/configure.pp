class mwdevel_argus::pap::configure (
  $pap_host                     = $mwdevel_argus::params::pap_host,
  $pap_port                     = $mwdevel_argus::params::pap_port,
  $pap_conf_dir                 = $mwdevel_argus::params::pap_conf_dir,
  $pap_admin_prop               = $mwdevel_argus::params::pap_admin_prop,
  $pap_auth                     = $mwdevel_argus::params::pap_auth,
  $pap_conf                     = $mwdevel_argus::params::pap_conf,
  $pap_shutdown_command         = $mwdevel_argus::params::pap_shutdown_command,
  $pap_shutdown_port            = $mwdevel_argus::params::pap_shutdown_port,
  $pap_poll_interval            = $mwdevel_argus::params::pap_poll_interval,
  $pap_ordering                 = $mwdevel_argus::params::pap_ordering,
  $pap_consistency_check        = $mwdevel_argus::params::pap_consistency_check,
  $pap_consistency_check_repair = $mwdevel_argus::params::pap_consistency_check_repair,
  $pap_env_file                 = $mwdevel_argus::params::pap_env_file,
  $pap_home                     = $mwdevel_argus::params::pap_home,
  $pap_pid                      = $mwdevel_argus::params::pap_pid,
  $pap_java_opts                = $mwdevel_argus::params::pap_java_opts,) inherits mwdevel_argus::params {
  #
  require mwdevel_argus::commons
  require mwdevel_argus::pap::install

  File {
    owner => root,
    group => root,
  }

  file {
    'pap_conf_dir':
      ensure => directory,
      path   => $pap_conf_dir,;

    'pap_admin':
      ensure  => file,
      path    => $pap_admin_prop,
      content => template('mwdevel_argus/pap-admin.properties.erb'),;

    'pap_auth':
      ensure  => file,
      path    => $pap_auth,
      content => template('mwdevel_argus/pap_authorization.ini.erb'),;

    'pap_conf':
      ensure  => file,
      path    => $pap_conf,
      content => template('mwdevel_argus/pap_configuration.ini.erb'),;

    'pap_env_file':
      ensure  => file,
      path    => $pap_env_file,
      content => template('mwdevel_argus/argus-pap.erb'),
  }

  File['pap_conf_dir'] -> File[['pap_admin', 'pap_auth', 'pap_conf']] -> File['pap_env_file']
}
