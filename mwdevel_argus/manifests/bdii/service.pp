class mwdevel_argus::bdii::service {
  require mwdevel_argus::bdii::configure

  service { 'bdii':
    ensure    => running,
    enable    => true,
    subscribe => File['gip_script'],
  }
}
