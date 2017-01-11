class mwdevel_argus::clients inherits mwdevel_argus::commons {
  include mwdevel_argus::pap::install

  package { 'argus-pepcli':
    ensure  => latest,
    require => File['argus-repo'],
  }
}

