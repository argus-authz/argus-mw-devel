class mwdevel_argus::pap::service {
  require mwdevel_argus::pap::configure

  service { 'argus-pap':
    ensure    => running,
    enable    => true,
    subscribe => File['pap_admin', 'pap_auth', 'pap_conf', 'pap_env_file'],
  }
}
