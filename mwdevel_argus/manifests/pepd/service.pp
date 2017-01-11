class mwdevel_argus::pepd::service {
  require mwdevel_argus::pepd::configure

  service { 'argus-pepd':
    ensure    => running,
    enable    => true,
    subscribe => File['pep_conf', 'pepd_env_file'],
  }
}
