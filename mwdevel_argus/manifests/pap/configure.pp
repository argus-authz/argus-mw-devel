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
  $pap_java_opts                = $mwdevel_argus::params::pap_java_opts,
  $log_level                    = $mwdevel_argus::params::log_level,) inherits mwdevel_argus::params {
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
      content => template('mwdevel_argus/pap/pap-admin.properties.erb'),
      require => File['pap_conf_dir'],;

    'pap_auth':
      ensure  => file,
      path    => $pap_auth,
      content => template('mwdevel_argus/pap/pap_authorization.ini.erb'),
      require => File['pap_conf_dir'],;

    'pap_conf':
      ensure  => file,
      path    => $pap_conf,
      content => template('mwdevel_argus/pap/pap_configuration.ini.erb'),
      require => File['pap_conf_dir'],;

    'pap_logging_conf_dir':
      ensure  => directory,
      path    => "${pap_conf_dir}/logging",
      require => File['pap_conf_dir'],;

    'pap_logging_client_conf_dir':
      ensure  => directory,
      path    => "${pap_conf_dir}/logging/client",
      require => File['pap_logging_conf_dir'],;

    'pap_logging_standalone_conf_dir':
      ensure  => directory,
      path    => "${pap_conf_dir}/logging/standalone",
      require => File['pap_logging_conf_dir'],;

    'pap_logging_client':
      ensure  => file,
      path    => "${pap_conf_dir}/logging/client/logback.xml",
      content => template('mwdevel_argus/pap/client/logback.xml.erb'),
      require => File['pap_logging_client_conf_dir'],;

    'pap_logging_standalone':
      ensure  => file,
      path    => "${pap_conf_dir}/logging/standalone/logback.xml",
      content => template('mwdevel_argus/pap/standalone/logback.xml.erb'),
      require => File['pap_logging_standalone_conf_dir'],;

    'pap_env_file':
      ensure  => file,
      path    => $pap_env_file,
      content => template('mwdevel_argus/argus-pap.erb'),
  }
}
