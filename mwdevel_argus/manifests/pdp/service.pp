class mwdevel_argus::pdp::service {
  require mwdevel_argus::pdp::configure

  service { 'argus-pdp':
    ensure    => running,
    enable    => true,
    subscribe => File['pdp_conf', 'pdp_env_file'],
  }
}
