class mwdevel_argus::pdp::configure (
  $pap_host               = $mwdevel_argus::params::pap_host,
  $pap_port               = $mwdevel_argus::params::pap_port,
  $pdp_host               = $mwdevel_argus::params::pdp_host,
  $pdp_port               = $mwdevel_argus::params::pdp_port,
  $pdp_conf_dir           = $mwdevel_argus::params::pdp_conf_dir,
  $pdp_conf               = $mwdevel_argus::params::pdp_conf,
  $pdp_admin_host         = $mwdevel_argus::params::pdp_admin_host,
  $pdp_admin_password     = $mwdevel_argus::params::pdp_admin_password,
  $pdp_retention_interval = $mwdevel_argus::params::pdp_retention_interval,
  $pdp_enable_ssl         = $mwdevel_argus::params::pdp_enable_ssl,
  $pdp_env_file           = $mwdevel_argus::params::pdp_env_file,
  $pdp_jopts              = $mwdevel_argus::params::pdp_jopts,
  $pdp_start_jopts        = $mwdevel_argus::params::pdp_start_jopts,
  $pdp_home               = $mwdevel_argus::params::pdp_home,
  $pdp_logdir             = $mwdevel_argus::params::pdp_logdir,
  $pdp_libdir             = $mwdevel_argus::params::pdp_libdir,
  $pdp_endorseddir        = $mwdevel_argus::params::pdp_endorseddir,
  $pdp_provideddir        = $mwdevel_argus::params::pdp_provideddir,
  $pdp_pid                = $mwdevel_argus::params::pdp_pid,) inherits mwdevel_argus::params {
  require mwdevel_argus::commons
  require mwdevel_argus::pdp::install

  file {
    'pdp_conf_dir':
      ensure => directory,
      path   => $pdp_conf_dir,;

    'pdp_conf':
      ensure  => file,
      path    => $pdp_conf,
      content => template('mwdevel_argus/pdp.ini.erb'),;

    'pdp_env_file':
      ensure  => file,
      path    => $pdp_env_file,
      content => template('mwdevel_argus/argus-pdp.erb'),;
  }

  File['pdp_conf_dir'] -> File['pdp_conf']

}
