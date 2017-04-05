include mwdevel_infn_ca
include mwdevel_test_ca
include mwdevel_egi_trust_anchors
include mwdevel_igtf_distribution
include mwdevel_test_ca_policies

include haveged
include mwdevel_argus

class { 'fetchcrl': require => Class['mwdevel_egi_trust_anchors'],; }
