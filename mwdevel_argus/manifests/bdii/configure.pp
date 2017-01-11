class mwdevel_argus::bdii::configure (
  $pap_host             = $mwdevel_argus::params::pap_host,
  $pap_port             = $mwdevel_argus::params::pap_host,
  $pdp_host             = $mwdevel_argus::params::pdp_host,
  $pdp_port             = $mwdevel_argus::params::pdp_host,
  $pep_host             = $mwdevel_argus::params::pep_host,
  $pep_port             = $mwdevel_argus::params::pep_host,
  $bdii_provider_script = $mwdevel_argus::params::bdii_provider_script,
  $bdii_service_conf    = $mwdevel_argus::params::bdii_service_conf,
  $bdii_pap_conf        = $mwdevel_argus::params::bdii_pap_conf,
  $bdii_pdp_conf        = $mwdevel_argus::params::bdii_pdp_conf,
  $bdii_pep_conf        = $mwdevel_argus::params::bdii_pep_conf,) inherits mwdevel_argus::params {
  #
  require mwdevel_argus::commons
  require mwdevel_argus::bdii::install

  file {
    'gip_script':
      ensure  => present,
      path    => $bdii_provider_script,
      owner   => ldap,
      group   => ldap,
      mode    => '0755',
      content => template('mwdevel_argus/glite-info-glue2-provider-service-argus.erb'),;

    'bdii_pap_conf':
      ensure  => present,
      path    => $bdii_pap_conf,
      owner   => root,
      group   => root,
      content => template('mwdevel_argus/glite-info-glue2-argus-pap.conf.erb'),;

    'bdii_pdp_conf':
      ensure  => present,
      path    => $bdii_pdp_conf,
      owner   => root,
      group   => root,
      content => template('mwdevel_argus/glite-info-glue2-argus-pdp.conf.erb'),;

    'bdii_pep_conf':
      ensure  => present,
      path    => $bdii_pep_conf,
      owner   => root,
      group   => root,
      content => template('mwdevel_argus/glite-info-glue2-argus-pep.conf.erb'),;

    'bdii_service_conf':
      ensure  => present,
      path    => $bdii_service_conf,
      owner   => root,
      group   => root,
      content => template('mwdevel_argus/glite-info-glue2-service-argus.conf.erb'),;
  }

}
