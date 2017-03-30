class mwdevel_argus::pepd::configure (
  $log_level                = $mwdevel_argus::params::log_level,
  $pap_host                 = $mwdevel_argus::params::pap_host,
  $pap_port                 = $mwdevel_argus::params::pap_port,
  $pdp_host                 = $mwdevel_argus::params::pdp_host,
  $pdp_port                 = $mwdevel_argus::params::pdp_port,
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
  $no_primary_group_name_is_error                     = $mwdevel_argus::params::no_primary_group_name_is_error,) inherits 
mwdevel_argus::params {
  require mwdevel_argus::commons
  require mwdevel_argus::pepd::install

  File {
    owner => root,
    group => root,
  }

  file {
    'pep_conf_dir':
      ensure => directory,
      path   => $pep_conf_dir,;

    'pep_conf':
      ensure  => file,
      path    => $pep_conf,
      content => template('mwdevel_argus/pepd/pepd.ini.erb'),
      require => File['pep_conf_dir'],;

    'pep_logging':
      ensure  => file,
      path    => "${pep_conf_dir}/logging.xml",
      content => template('mwdevel_argus/pepd/logging.xml.erb'),
      require => File['pep_conf_dir'],;

    'account_map_file':
      ensure => file,
      path   => $account_map_file,
      source => 'puppet:///modules/mwdevel_argus/grid-mapfile',;

    'group_map_file':
      ensure => file,
      path   => $group_map_file,
      source => 'puppet:///modules/mwdevel_argus/groupmapfile',;

    'gridmapdir':
      ensure  => directory,
      path    => $grid_map_dir,
      recurse => true,
      purge   => true,
      source  => 'puppet:///modules/mwdevel_argus/gridmapdir',;

    'vomsdir':
      ensure  => directory,
      path    => $voms_dir,
      recurse => true,
      purge   => true,
      source  => 'puppet:///modules/mwdevel_argus/vomsdir',;

    'voms_map_file':
      ensure => file,
      path   => $voms_map_file,
      source => 'puppet:///modules/mwdevel_argus/voms-grid-mapfile',;

    'pepd_env_file':
      ensure  => file,
      path    => $pep_env_file,
      content => template('mwdevel_argus/argus-pepd.erb'),;
  }
}
