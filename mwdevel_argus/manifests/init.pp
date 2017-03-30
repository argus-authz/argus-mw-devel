class mwdevel_argus (
  $log_level                = $mwdevel_argus::params::log_level,
  $pap_host                 = $mwdevel_argus::params::pap_host,
  $pap_port                 = $mwdevel_argus::params::pap_port,
  $pap_conf_dir             = $mwdevel_argus::params::pap_conf_dir,
  $pap_admin_prop           = $mwdevel_argus::params::pap_admin_prop,
  $pap_auth                 = $mwdevel_argus::params::pap_auth,
  $pap_conf                 = $mwdevel_argus::params::pap_conf,
  $pap_shutdown_command     = $mwdevel_argus::params::pap_shutdown_command,
  $pap_poll_interval        = $mwdevel_argus::params::pap_poll_interval,
  $pap_ordering             = $mwdevel_argus::params::pap_ordering,
  $pap_consistency_check    = $mwdevel_argus::params::pap_consistency_check,
  $pap_consistency_check_repair                       = $mwdevel_argus::params::pap_consistency_check_repair,
  $pap_env_file             = $mwdevel_argus::params::pap_env_file,
  $pap_home                 = $mwdevel_argus::params::pap_home,
  $pap_pid                  = $mwdevel_argus::params::pap_pid,
  $pap_java_opts            = $mwdevel_argus::params::pap_java_opts,
  $pdp_host                 = $mwdevel_argus::params::pdp_host,
  $pdp_port                 = $mwdevel_argus::params::pdp_port,
  $pdp_conf_dir             = $mwdevel_argus::params::pdp_conf_dir,
  $pdp_conf                 = $mwdevel_argus::params::pdp_conf,
  $pdp_admin_host           = $mwdevel_argus::params::pdp_admin_host,
  $pdp_admin_password       = $mwdevel_argus::params::pdp_admin_password,
  $pdp_retention_interval   = $mwdevel_argus::params::pdp_retention_interval,
  $pdp_enable_ssl           = $mwdevel_argus::params::pdp_enable_ssl,
  $pdp_env_file             = $mwdevel_argus::params::pdp_env_file,
  $pdp_jopts                = $mwdevel_argus::params::pdp_jopts,
  $pdp_start_jopts          = $mwdevel_argus::params::pdp_start_jopts,
  $pdp_home                 = $mwdevel_argus::params::pdp_home,
  $pdp_logdir               = $mwdevel_argus::params::pdp_logdir,
  $pdp_libdir               = $mwdevel_argus::params::pdp_libdir,
  $pdp_endorseddir          = $mwdevel_argus::params::pdp_endorseddir,
  $pdp_provideddir          = $mwdevel_argus::params::pdp_provideddir,
  $pdp_pid                  = $mwdevel_argus::params::pdp_pid,
  $pep_host                 = $mwdevel_argus::params::pep_host,
  $pep_port                 = $mwdevel_argus::params::pep_port,
  $pep_conf_dir             = $mwdevel_argus::params::pep_conf_dir,
  $pep_conf                 = $mwdevel_argus::params::pep_conf,
  $pep_admin_host           = $mwdevel_argus::params::pep_admin_host,
  $pep_admin_password       = $mwdevel_argus::params::pep_admin_password,
  $pep_pips                 = $mwdevel_argus::params::pep_pips,
  $pep_obligation_handlers  = $mwdevel_argus::params::pep_obligation_handlers,
  $pep_enable_ssl           = $mwdevel_argus::params::pep_enable_ssl,
  $req_client_cert_auth     = $mwdevel_argus::params::req_client_cert_auth,
  $request_validator_pip_parser_class                 = $mwdevel_argus::params::request_validator_pip_parser_class,
  $request_validator_pip_validate_request_subjects    = $mwdevel_argus::params::request_validator_pip_validate_request_subjects,
  $request_validator_pip_validate_request_resources   = $mwdevel_argus::params::request_validator_pip_validate_request_resources,
  $request_validator_pip_validate_request_action      = $mwdevel_argus::params::request_validator_pip_validate_request_action,
  $request_validator_pip_validate_request_environment = $mwdevel_argus::params::request_validator_pip_validate_request_environment,
  $openssl_pip_parser_class = $mwdevel_argus::params::openssl_pip_parser_class,
  $openssl_pip_subject_attribute_ids                  = $mwdevel_argus::params::openssl_pip_subject_attribute_ids,
  $openssl_pip_subject_attribute_datatypes            = $mwdevel_argus::params::openssl_pip_subject_attribute_datatypes,
  $glite_xacml_pip_parser_class                       = $mwdevel_argus::params::glite_xacml_pip_parser_class,
  $glite_xacml_pip_accepted_profile_ids               = $mwdevel_argus::params::glite_xacml_pip_accepted_profile_ids,
  $common_xacml_pip_parser_class                      = $mwdevel_argus::params::common_xacml_pip_parser_class,
  $common_xacml_pip_accepted_profile_ids              = $mwdevel_argus::params::common_xacml_pip_accepted_profile_ids,
  $account_map_parser_class = $mwdevel_argus::params::account_map_parser_class,
  $account_map_file         = $mwdevel_argus::params::account_map_file,
  $group_map_file           = $mwdevel_argus::params::group_map_file,
  $grid_map_dir             = $mwdevel_argus::params::grid_map_dir,
  $voms_dir                 = $mwdevel_argus::params::voms_dir,
  $voms_map_file            = $mwdevel_argus::params::voms_map_file,
  $pep_env_file             = $mwdevel_argus::params::pep_env_file,
  $pepd_jopts               = $mwdevel_argus::params::pepd_jopts,
  $pepd_start_jopts         = $mwdevel_argus::params::pepd_start_jopts,
  $pepd_home                = $mwdevel_argus::params::pepd_home,
  $pepd_logdir              = $mwdevel_argus::params::pepd_logdir,
  $pepd_libdir              = $mwdevel_argus::params::pepd_libdir,
  $pepd_endorseddir         = $mwdevel_argus::params::pepd_endorseddir,
  $pepd_provideddir         = $mwdevel_argus::params::pepd_provideddir,
  $pepd_pid                 = $mwdevel_argus::params::pepd_pid,
  $use_secondary_group_names_for_mapping              = $mwdevel_argus::params::use_secondary_group_names_for_mapping,
  $prefer_dn_for_login_name = $mwdevel_argus::params::prefer_dn_for_login_name,
  $prefer_dn_for_primary_group_name                   = $mwdevel_argus::params::prefer_dn_for_primary_group_name,
  $no_primary_group_name_is_error                     = $mwdevel_argus::params::no_primary_group_name_is_error,
  $bdii_provider_script     = $mwdevel_argus::params::bdii_provider_script,
  $bdii_service_conf        = $mwdevel_argus::params::bdii_service_conf,
  $bdii_pap_conf            = $mwdevel_argus::params::bdii_pap_conf,
  $bdii_pdp_conf            = $mwdevel_argus::params::bdii_pdp_conf,
  $bdii_pep_conf            = $mwdevel_argus::params::bdii_pep_conf,) inherits mwdevel_argus::params {
  #
  class { 'mwdevel_argus::pap':
    pap_host                     => $pap_host,
    pap_port                     => $pap_port,
    pap_conf_dir                 => $pap_conf_dir,
    pap_admin_prop               => $pap_admin_prop,
    pap_auth                     => $pap_auth,
    pap_conf                     => $pap_conf,
    pap_shutdown_command         => $pap_shutdown_command,
    pap_poll_interval            => $pap_poll_interval,
    pap_ordering                 => $pap_ordering,
    pap_consistency_check        => $pap_consistency_check,
    pap_consistency_check_repair => $pap_consistency_check_repair,
    pap_env_file                 => $pap_env_file,
    pap_home                     => $pap_home,
    pap_pid                      => $pap_pid,
    pap_java_opts                => $pap_java_opts,
    log_level                    => $log_level,
  } ->
  class { 'mwdevel_argus::pdp':
    pap_host               => $pap_host,
    pap_port               => $pap_port,
    pdp_host               => $pdp_host,
    pdp_port               => $pdp_port,
    pdp_conf_dir           => $pdp_conf_dir,
    pdp_conf               => $pdp_conf,
    pdp_admin_host         => $pdp_admin_host,
    pdp_admin_password     => $pdp_admin_password,
    pdp_retention_interval => $pdp_retention_interval,
    pdp_enable_ssl         => $pdp_enable_ssl,
    pdp_env_file           => $pdp_env_file,
    pdp_jopts              => $pdp_jopts,
    pdp_start_jopts        => $pdp_start_jopts,
    pdp_home               => $pdp_home,
    pdp_logdir             => $pdp_logdir,
    pdp_libdir             => $pdp_libdir,
    pdp_endorseddir        => $pdp_endorseddir,
    pdp_provideddir        => $pdp_provideddir,
    pdp_pid                => $pdp_pid,
    log_level              => $log_level,
  } ->
  class { 'mwdevel_argus::pepd':
    pap_host                 => $pap_host,
    pap_port                 => $pap_port,
    pdp_host                 => $pdp_host,
    pdp_port                 => $pdp_port,
    pep_host                 => $pep_host,
    pep_port                 => $pep_port,
    pep_conf_dir             => $pep_conf_dir,
    pep_conf                 => $pep_conf,
    pep_admin_host           => $pep_admin_host,
    pep_admin_password       => $pep_admin_password,
    pep_pips                 => $pep_pips,
    pep_obligation_handlers  => $pep_obligation_handlers,
    pep_enable_ssl           => $pep_enable_ssl,
    req_client_cert_auth     => $req_client_cert_auth,
    request_validator_pip_parser_class                 => $request_validator_pip_parser_class,
    request_validator_pip_validate_request_subjects    => $request_validator_pip_validate_request_subjects,
    request_validator_pip_validate_request_resources   => $request_validator_pip_validate_request_resources,
    request_validator_pip_validate_request_action      => $request_validator_pip_validate_request_action,
    request_validator_pip_validate_request_environment => $request_validator_pip_validate_request_environment,
    openssl_pip_parser_class => $openssl_pip_parser_class,
    openssl_pip_subject_attribute_ids                  => $openssl_pip_subject_attribute_ids,
    openssl_pip_subject_attribute_datatypes            => $openssl_pip_subject_attribute_datatypes,
    glite_xacml_pip_parser_class                       => $glite_xacml_pip_parser_class,
    glite_xacml_pip_accepted_profile_ids               => $glite_xacml_pip_accepted_profile_ids,
    common_xacml_pip_parser_class                      => $common_xacml_pip_parser_class,
    common_xacml_pip_accepted_profile_ids              => $common_xacml_pip_accepted_profile_ids,
    account_map_parser_class => $account_map_parser_class,
    account_map_file         => $account_map_file,
    group_map_file           => $group_map_file,
    grid_map_dir             => $grid_map_dir,
    voms_dir                 => $voms_dir,
    voms_map_file            => $voms_map_file,
    pep_env_file             => $pep_env_file,
    pepd_jopts               => $pepd_jopts,
    pepd_start_jopts         => $pepd_start_jopts,
    pepd_home                => $pepd_home,
    pepd_logdir              => $pepd_logdir,
    pepd_libdir              => $pepd_libdir,
    pepd_endorseddir         => $pepd_endorseddir,
    pepd_provideddir         => $pepd_provideddir,
    pepd_pid                 => $pepd_pid,
    use_secondary_group_names_for_mapping              => $use_secondary_group_names_for_mapping,
    prefer_dn_for_login_name => $prefer_dn_for_login_name,
    prefer_dn_for_primary_group_name                   => $prefer_dn_for_primary_group_name,
    no_primary_group_name_is_error                     => $no_primary_group_name_is_error,
    log_level                => $log_level,
  } ->
  class { 'mwdevel_argus::bdii':
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
  } ->
  class { 'mwdevel_argus::clients': }
}
