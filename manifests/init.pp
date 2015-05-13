# File::      <tt>ejabberd.pp</tt>
# Author::    Hyacinthe Cartiaux (hyacinthe.cartiaux@uni.lu)
# Copyright:: Copyright (c) 2012 Hyacinthe Cartiaux
# License::   GPLv3
#
# ------------------------------------------------------------------------------
# = Class: ejabberd
#
# Configure and manage ejabberd
#
# == Parameters:
#
# $ensure:: *Default*: 'present'. Ensure the presence (or absence) of ejabberd
#
# == Actions:
#
# Install and configure ejabberd
#
# == Requires:
#
# n/a
#
# == Sample Usage:
#
#     import ejabberd
#
# You can then specialize the various aspects of the configuration,
# for instance:
#
#         class { 'ejabberd':
#             ensure => 'present'
#         }
#
# == Warnings
#
# /!\ Always respect the style guide available
# here[http://docs.puppetlabs.com/guides/style_guide]
#
#
# [Remember: No empty lines between comments and class definition]
#
class ejabberd(
    $ensure                   = $ejabberd::params::ensure,
    $log_level                = $ejabberd::params::log_level,
    $port_c2s                 = $ejabberd::params::port_c2s,
    $port_s2s                 = $ejabberd::params::port_s2s,
    $port_http_admin          = $ejabberd::params::port_http_admin,
    $s2s_starttls             = $ejabberd::params::s2s_starttls,
    $s2s_default_policy       = $ejabberd::params::s2s_default_policy,
    $certfile_path            = $ejabberd::params::certfile_path,
    $shaper_c2s               = $ejabberd::params::shaper_c2s,
    $shaper_s2s               = $ejabberd::params::shaper_s2s,
    $max_user_sessions        = $ejabberd::params::max_user_sessions,
    $max_user_offline_msg     = $ejabberd::params::max_user_offline_msg,
    $max_admin_offline_msg    = $ejabberd::params::max_admin_offline_msg,
    $default_lang             = $ejabberd::params::default_lang,
    $ldap_server,
    $ldap_encrypt             = $ejabberd::params::ldap_encrypt,
    $ldap_tls_verify          = $ejabberd::params::ldap_tls_verify,
    $ldap_port                = $ejabberd::params::ldap_port,
    $ldap_search_base         = $ejabberd::params::ldap_search_base,
    $ldap_deref               = $ejabberd::params::ldap_deref,
    $ldap_uid_attr            = $ejabberd::params::ldap_uid_attr,
    $ldap_filter              = $ejabberd::params::ldap_filter,
    $vcard_ldap_base          = '',
    $muc_log_dir              = $ejabberd::params::muc_log_dir,
    $muc_log_timezone         = $ejabberd::params::muc_log_timezone,
    $admin                    = $ejabberd::params::admin,
    $register                 = $ejabberd::params::register
)
inherits ejabberd::params
{
    info ("Configuring ejabberd (with ensure = ${ensure})")

    if ! ($ensure in [ 'present', 'absent' ]) {
        fail("ejabberd 'ensure' parameter must be set to either 'absent' or 'present'")
    }

    case $::operatingsystem {
        debian, ubuntu:         { include ejabberd::common::debian }
        default: {
            fail("Module ${module_name} is not supported on ${::operatingsystem}")
        }
    }
}

