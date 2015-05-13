# File::      <tt>params.pp</tt>
# Author::    UL HPC Management Team (hpc-sysadmins@uni.lu)
# Copyright:: Copyright (c) 2015 UL HPC Management Team
# License::   Gpl-3.0
#
# ------------------------------------------------------------------------------
# You need the 'future' parser to be able to execute this manifest (that's
# required for the each loop below).
#
# Thus execute this manifest in your vagrant box as follows:
#
#      sudo puppet apply -t --parser future /vagrant/tests/params.pp
#
#

include 'ejabberd::params'

$names = ['ensure', 'log_level', 'port_c2s', 'port_s2s', 'port_http_admin', 's2s_starttls', 's2s_default_policy', 'certfile_path', 'shaper_c2s', 'shaper_s2s', 'max_user_sessions', 'max_user_offline_msg', 'max_admin_offline_msg', 'default_lang', 'ldap_encrypt', 'ldap_tls_verify', 'ldap_port', 'ldap_search_base', 'ldap_deref_aliases', 'ldap_uid_attr', 'ldap_filter', 'muc_log_dir', 'muc_log_timezone', 'admin', 'register', 'packagename', 'servicename', 'configdir', 'configdir_mode', 'configdir_owner', 'configdir_group', 'configfile', 'configfile_mode', 'configfile_owner', 'configfile_group', 'muc_log_dir_mode', 'muc_log_dir_owner', 'muc_log_dir_group']

notice("ejabberd::params::ensure = ${ejabberd::params::ensure}")
notice("ejabberd::params::log_level = ${ejabberd::params::log_level}")
notice("ejabberd::params::port_c2s = ${ejabberd::params::port_c2s}")
notice("ejabberd::params::port_s2s = ${ejabberd::params::port_s2s}")
notice("ejabberd::params::port_http_admin = ${ejabberd::params::port_http_admin}")
notice("ejabberd::params::s2s_starttls = ${ejabberd::params::s2s_starttls}")
notice("ejabberd::params::s2s_default_policy = ${ejabberd::params::s2s_default_policy}")
notice("ejabberd::params::certfile_path = ${ejabberd::params::certfile_path}")
notice("ejabberd::params::shaper_c2s = ${ejabberd::params::shaper_c2s}")
notice("ejabberd::params::shaper_s2s = ${ejabberd::params::shaper_s2s}")
notice("ejabberd::params::max_user_sessions = ${ejabberd::params::max_user_sessions}")
notice("ejabberd::params::max_user_offline_msg = ${ejabberd::params::max_user_offline_msg}")
notice("ejabberd::params::max_admin_offline_msg = ${ejabberd::params::max_admin_offline_msg}")
notice("ejabberd::params::default_lang = ${ejabberd::params::default_lang}")
notice("ejabberd::params::ldap_encrypt = ${ejabberd::params::ldap_encrypt}")
notice("ejabberd::params::ldap_tls_verify = ${ejabberd::params::ldap_tls_verify}")
notice("ejabberd::params::ldap_port = ${ejabberd::params::ldap_port}")
notice("ejabberd::params::ldap_search_base = ${ejabberd::params::ldap_search_base}")
notice("ejabberd::params::ldap_deref_aliases = ${ejabberd::params::ldap_deref_aliases}")
notice("ejabberd::params::ldap_uid_attr = ${ejabberd::params::ldap_uid_attr}")
notice("ejabberd::params::ldap_filter = ${ejabberd::params::ldap_filter}")
notice("ejabberd::params::muc_log_dir = ${ejabberd::params::muc_log_dir}")
notice("ejabberd::params::muc_log_timezone = ${ejabberd::params::muc_log_timezone}")
notice("ejabberd::params::admin = ${ejabberd::params::admin}")
notice("ejabberd::params::register = ${ejabberd::params::register}")
notice("ejabberd::params::packagename = ${ejabberd::params::packagename}")
notice("ejabberd::params::servicename = ${ejabberd::params::servicename}")
notice("ejabberd::params::configdir = ${ejabberd::params::configdir}")
notice("ejabberd::params::configdir_mode = ${ejabberd::params::configdir_mode}")
notice("ejabberd::params::configdir_owner = ${ejabberd::params::configdir_owner}")
notice("ejabberd::params::configdir_group = ${ejabberd::params::configdir_group}")
notice("ejabberd::params::configfile = ${ejabberd::params::configfile}")
notice("ejabberd::params::configfile_mode = ${ejabberd::params::configfile_mode}")
notice("ejabberd::params::configfile_owner = ${ejabberd::params::configfile_owner}")
notice("ejabberd::params::configfile_group = ${ejabberd::params::configfile_group}")
notice("ejabberd::params::muc_log_dir_mode = ${ejabberd::params::muc_log_dir_mode}")
notice("ejabberd::params::muc_log_dir_owner = ${ejabberd::params::muc_log_dir_owner}")
notice("ejabberd::params::muc_log_dir_group = ${ejabberd::params::muc_log_dir_group}")

#each($names) |$v| {
#    $var = "ejabberd::params::${v}"
#    notice("${var} = ", inline_template('<%= scope.lookupvar(@var) %>'))
#}
