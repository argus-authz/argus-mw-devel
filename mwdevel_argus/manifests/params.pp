class mwdevel_argus::params {
  # common
  $log_level = 'INFO'
  $conf_dir = '/etc/argus'

  $ci_base_url = $lsbmajdistrelease ? {
    '6'     => 'https://repo.cloud.cnaf.infn.it/repository/argus/nightly/el6/',
    '7'     => 'https://repo.cloud.cnaf.infn.it/repository/argus/nightly/el7/',
    default => fail('Unsupported OS'),
  }

  $rpm_base_url = pick($::argus_repo_base_url, $ci_base_url)

  $certificate_path = '/etc/grid-security/hostcert.pem '
  $private_key_path = '/etc/grid-security/hostkey.pem '

  $grid_security_dir = '/etc/grid-security'
  $trust_info_dir = "${grid_security_dir}/certificates"

  $pap_host = $fqdn
  $pap_port = 8150
  $pap_shutdown_port = 8151

  $pdp_host = $fqdn
  $pdp_port = 8152
  $pdp_admin_port = 8153

  $pep_host = $fqdn
  $pep_port = 8154
  $pep_admin_port = 8155

  # PAP
  $pap_env_file = '/etc/sysconfig/argus-pap'
  $pap_conf_dir = "${conf_dir}/pap"
  $pap_admin_prop = "${pap_conf_dir}/pap-admin.properties"
  $pap_auth = "${pap_conf_dir}/pap_authorization.ini"
  $pap_conf = "${pap_conf_dir}/pap_configuration.ini"
  $pap_shutdown_command = 'shutdown'
  $pap_poll_interval = '300'
  $pap_ordering = 'default'
  $pap_consistency_check = true
  $pap_consistency_check_repair = false
  $pap_home = '/usr/share/argus/pap'
  $pap_pid = '/var/run/argus-pap.pid'
  $pap_java_opts = ''

  # PDP
  $pdp_env_file = '/etc/sysconfig/argus-pdp'
  $pdp_conf_dir = "${conf_dir}/pdp"
  $pdp_conf = "${pdp_conf_dir}/pdp.ini"
  $pdp_admin_host = 'localhost'
  $pdp_admin_password = 'pdpadmin_password'
  $pdp_retention_interval = '240'
  $pdp_enable_ssl = true
  $pdp_jopts = '-Xmx256M -Djdk.tls.trustNameService=true'
  $pdp_start_jopts = ''
  $pdp_home = '/usr/share/argus/pdp'
  $pdp_logdir = '/var/log/argus/pdp'
  $pdp_libdir = '/var/lib/argus/pdp/lib'
  $pdp_endorseddir = "${pdp_libdir}/endorsed"
  $pdp_provideddir = "${pdp_libdir}/provided"
  $pdp_pid = '/var/run/argus-pdp.pid'

  # PEP
  $pep_env_file = '/etc/sysconfig/argus-pepd'
  $pep_conf_dir = "${conf_dir}/pepd"
  $pep_conf = "${pep_conf_dir}/pepd.ini"
  $pep_admin_host = 'localhost'
  $pep_admin_password = 'pepdadmin_password'

  $pepd_jopts = '-Xmx256M -Djdk.tls.trustNameService=true'
  $pepd_start_jopts = ''
  $pepd_home = '/usr/share/argus/pepd'
  $pepd_logdir = '/var/log/argus/pepd'
  $pepd_libdir = '/var/lib/argus/pepd/lib'
  $pepd_endorseddir = "${pepd_libdir}/endorsed"
  $pepd_provideddir = "${pepd_libdir}/provided"
  $pepd_pid = '/var/run/argus-pepd.pid'

  $account_map_file = "${grid_security_dir}/grid-mapfile"
  $group_map_file = "${grid_security_dir}/groupmapfile"
  $grid_map_dir = "${grid_security_dir}/gridmapdir"

  $voms_dir = "${grid_security_dir}/vomsdir"
  $voms_map_file = "${grid_security_dir}/voms-grid-mapfile"
  $authn_profile_file = "${grid_security_dir}/vo-ca-ap-file"

  $pep_pips = 'REQVALIDATOR_PIP OPENSSLSUBJECT_PIP GLITEXACMLPROFILE_PIP COMMONXACMLPROFILE_PIP AUTHN_PROFILE_PIP'
  $pep_obligation_handlers = 'ACCOUNTMAP_OH'

  $pep_enable_ssl = true
  $req_client_cert_auth = true

  $request_validator_pip_validate_request_subjects = true
  $request_validator_pip_validate_request_resources = true
  $request_validator_pip_validate_request_action = true
  $request_validator_pip_validate_request_environment = false

  $openssl_pip_subject_attribute_ids = 'http://glite.org/xacml/attribute/subject-issuer urn:oasis:names:tc:xacml:1.0:subject:subject-id'
  $openssl_pip_subject_attribute_datatypes = 'http://www.w3.org/2001/XMLSchema#string'

  $glite_xacml_pip_accepted_profile_ids = 'http://glite.org/xacml/profile/grid-ce/1.0 http://glite.org/xacml/profile/grid-wn/1.0'

  $common_xacml_pip_accepted_profile_ids = 'http://dci-sec.org/xacml/profile/common-authz/1.1'

  $authn_profile_pip_policy_file = $authn_profile_file
  $authn_profile_pip_trust_info_dir = $trust_info_dir
  $authn_profile_pip_policy_pattern = 'policy-*.info'
  $authn_profile_pip_refresh_interval = '14400'

  $use_secondary_group_names_for_mapping = false
  $prefer_dn_for_login_name = true
  $prefer_dn_for_primary_group_name = true
  $no_primary_group_name_is_error = false

  # BDII
  $bdii_conf_dir = '/etc/glite/info/service'
  $bdii_gip_dir = '/var/lib/bdii/gip/provider'

  $bdii_provider_script = "${bdii_gip_dir}/glite-info-glue2-provider-service-argus"
  $bdii_service_conf = "${bdii_conf_dir}/glite-info-glue2-service-argus.conf"
  $bdii_pap_conf = "${bdii_conf_dir}/glite-info-glue2-argus-pap.conf"
  $bdii_pdp_conf = "${bdii_conf_dir}/glite-info-glue2-argus-pdp.conf"
  $bdii_pep_conf = "${bdii_conf_dir}/glite-info-glue2-argus-pep.conf"
}
