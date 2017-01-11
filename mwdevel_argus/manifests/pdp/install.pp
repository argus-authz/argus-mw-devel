class mwdevel_argus::pdp::install {
  package { 'argus-pdp':
    ensure  => latest,
    require => File['argus-repo'],
  }
}
