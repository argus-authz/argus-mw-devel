class mwdevel_argus::bdii (
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

  class { 'mwdevel_argus::bdii::install': } ->
  class { 'mwdevel_argus::bdii::configure':
    pap_host             => $pap_host,
    pap_port             => $pap_host,
    pdp_host             => $pdp_host,
    pdp_port             => $pdp_host,
    pep_host             => $pep_host,
    pep_port             => $pep_host,
    bdii_provider_script => $bdii_provider_script,
    bdii_service_conf    => $bdii_service_conf,
    bdii_pap_conf        => $bdii_pap_conf,
    bdii_pdp_conf        => $bdii_pdp_conf,
    bdii_pep_conf        => $bdii_pep_conf,
  } ~>
  class { 'mwdevel_argus::bdii::service': }
}
