class mwdevel_argus::pap::install {
  package { 'argus-pap':
    ensure  => latest,
    require => File['argus-repo'],
  }
}
