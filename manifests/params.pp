# File::      <tt>ejabberd-params.pp</tt>
# Author::    Hyacinthe Cartiaux (hyacinthe.cartiaux@uni.lu)
# Copyright:: Copyright (c) 2012 Hyacinthe Cartiaux
# License::   GPLv3
#
# ------------------------------------------------------------------------------
# = Class: ejabberd::params
#
# In this class are defined as variables values that are used in other
# ejabberd classes.
# This class should be included, where necessary, and eventually be enhanced
# with support for more OS
#
# == Warnings
#
# /!\ Always respect the style guide available
# here[http://docs.puppetlabs.com/guides/style_guide]
#
# The usage of a dedicated param classe is advised to better deal with
# parametrized classes, see
# http://docs.puppetlabs.com/guides/parameterized_classes.html
#
# [Remember: No empty lines between comments and class definition]
#
class ejabberd::params {

    ######## DEFAULTS FOR VARIABLES USERS CAN SET ##########################
    # (Here are set the defaults, provide your custom variables externally)
    # (The default used is in the line with '')
    ###########################################

    # ensure the presence (or absence) of ejabberd
    $ensure = $::ejabberd_ensure ? {
        ''      => 'present',
        default => $::ejabberd_ensure
    }

    # The Protocol used. Used by monitor and firewall class. Default is 'tcp'
    $log_level = $::ejabberd_loglevel ? {
        ''      => '4',
        default => $::ejabberd_loglevel,
    }

    $port_c2s = $::ejabberd_port_c2s ? {
        ''      => '5222',
        default => $::ejabberd_port_c2s,
    }
    $enable_xmpps = false
    $xmpps_port_c2s = $::ejabberd_xmpps_port_c2s ? {
        ''      => '5223',
        default => $::ejabberd_xmpps_port_c2s,
    }
    $port_s2s = $::ejabberd_port_s2s ? {
        ''      => '5269',
        default => $::ejabberd_port_s2s,
    }
    $port_http_admin = $::ejabberd_port_http_admin ? {
        ''      => '5280',
        default => $::ejabberd_port_http_admin,
    }

    $s2s_starttls = $::ejabberd_s2s_starttls ? {
        ''      => true,
        default => $::ejabberd_s2s_starttls,
    }

    $s2s_default_policy = $::ejabberd_s2s_default_policy ? {
        ''      => 'allow',
        default => $::ejabberd_s2s_default_policy,
    }

    $certfile_path = $::ejabberd_certfile_path ? {
        ''      => '/etc/ejabberd/ejabberd.pem',
        default => $::ejabberd_certfile_path,
    }


    $shaper_c2s = $::ejabberd_shaper_c2s ? {
        ''      => '1000',
        default => $::ejabberd_shaper_c2s,
    }

    $shaper_s2s = $::ejabberd_shaper_s2s ? {
        ''      => '50000',
        default => $::ejabberd_shaper_s2s,
    }

    $max_user_sessions = $::ejabberd_max_user_sessions ? {
        ''      => '10',
        default => $::ejabberd_max_user_sessions,
    }

    $max_user_offline_msg = $::ejabberd_max_user_offline_msg ? {
        ''      => '100',
        default => $::ejabberd_max_user_offline_msg,
    }

    $max_admin_offline_msg = $::ejabberd_max_admin_offline_msg ? {
        ''      => '5000',
        default => $::ejabberd_max_admin_offline_msg,
    }

    $default_lang = $::ejabberd_default_lang ? {
        ''      => 'fr',
        default => $::ejabberd_default_lang,
    }

    $ldap_encrypt = $::ejabberd_ldap_encrypt ? {
        ''      => 'tls',
        default => $::ejabberd_ldap_encrypt,
    }

    $ldap_tls_verify = $::ejabberd_ldap_tls_verify ? {
        ''      => false,
        default => $::ejabberd_ldap_tls_verify,
    }

    $ldap_port = $::ejabberd_ldap_port ? {
        ''      => '636',
        default => $::ejabberd_ldap_port,
    }

    $ldap_search_base = $::ejabberd_ldap_search_base ? {
        ''      => 'dc=uni,dc=lu',
        default => $::ejabberd_ldap_search_base,
    }

    $ldap_deref_aliases = $::ejabberd_ldap_deref_aliases ? {
        ''      => 'never',
        default => $::ejabberd_ldap_deref_aliases,
    }

    $ldap_uid_attr = $::ejabberd_ldap_uid_attr ? {
        ''      => 'uid',
        default => $::ejabberd_ldap_uid_attr,
    }

    $ldap_filter = $::ejabberd_ldap_filter ? {
        ''      => '(objectClass=inetOrgPerson)',
        default => $::ejabberd_ldap_filter,
    }

    $muc_log_dir = $::ejabberd_muc_log_dir ? {
        ''      => '/var/log/ejabberd/muc',
        default => $::ejabberd_muc_log_dir,
    }

    $muc_log_timezone = $::ejabberd_muc_log_timezone ? {
        ''      => 'local',
        default => $::ejabberd_muc_log_timezone,
    }

    $admin = $::ejabberd_admin ? {
        ''      => 'admin',
        default => $::ejabberd_admin,
    }

    $register = $::ejabberd_register ? {
        ''      => 'deny',
        default => $::ejabberd_register,
    }


    #### MODULE INTERNAL VARIABLES  #########
    # (Modify to adapt to unsupported OSes)
    #######################################
    # ejabberd packages
    $packagename = $::operatingsystem ? {
        default => 'ejabberd',
    }

    # ejabberd associated services
    $servicename = $::operatingsystem ? {
        /(?i-mx:ubuntu|debian)/ => 'ejabberd',
        default                 => 'ejabberd'
    }

    # Configuration directory & file
    $configdir = $::operatingsystem ? {
        default => '/etc/ejabberd',
    }
    $configdir_mode = $::operatingsystem ? {
        default => '0755',
    }
    $configdir_owner = $::operatingsystem ? {
        default => 'root',
    }
    $configdir_group = $::operatingsystem ? {
        default => 'root',
    }

    $configfile = $::operatingsystem ? {
        default => '/etc/ejabberd/ejabberd.cfg',
    }
    $configfile_mode = $::operatingsystem ? {
        default => '0640',
    }
    $configfile_owner = $::operatingsystem ? {
        default => 'root',
    }
    $configfile_group = $::operatingsystem ? {
        default => 'ejabberd',
    }

    $muc_log_dir_mode = $::operatingsystem ? {
        default => '700',
    }
    $muc_log_dir_owner = $::operatingsystem ? {
        default => 'ejabberd',
    }
    $muc_log_dir_group = $::operatingsystem ? {
        default => 'ejabberd',
    }


}

