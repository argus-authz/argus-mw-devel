class mwdevel_argus::pap (
  $pap_host                     = $mwdevel_argus::params::pap_host,
  $pap_port                     = $mwdevel_argus::params::pap_port,
  $pap_conf_dir                 = $mwdevel_argus::params::pap_conf_dir,
  $pap_admin_prop               = $mwdevel_argus::params::pap_admin_prop,
  $pap_auth                     = $mwdevel_argus::params::pap_auth,
  $pap_conf                     = $mwdevel_argus::params::pap_conf,
  $pap_shutdown_command         = $mwdevel_argus::params::pap_shutdown_command,
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

  class { 'mwdevel_argus::pap::install': } ->
  class { 'mwdevel_argus::pap::configure':
    pap_host                     => $pap_host,
    pap_port                     => $pap_port,
    pap_conf_dir                 => $pap_conf_dir,
    pap_admin_prop               => $pap_admin_prop,
    pap_auth                     => $pap_auth,
    pap_conf                     => $pap_conf,
    pap_shutdown_command         => $pap_shutdown_command,
    pap_poll_interval            => $pap_poll_interval,
    pap_ordering                 => $pap_ordering,
    pap_consistency_check        => $pap_consistency_check,
    pap_consistency_check_repair => $pap_consistency_check_repair,
    pap_env_file                 => $pap_env_file,
    pap_home                     => $pap_home,
    pap_pid                      => $pap_pid,
    pap_java_opts                => $pap_java_opts,
    log_level                    => $log_level,
  } ~>
  class { 'mwdevel_argus::pap::service': }
}
