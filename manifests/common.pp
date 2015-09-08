# File::      <tt>common.pp</tt>
# Author::    Hyacinthe Cartiaux (hyacinthe.cartiaux@uni.lu)
# Copyright:: Copyright (c) 2012 Hyacinthe Cartiaux
# License::   GPLv3
# ------------------------------------------------------------------------------
# = Class: ejabberd::common
#
# Base class to be inherited by the other ejabberd classes
#
# Note: respect the Naming standard provided here[http://projects.puppetlabs.com/projects/puppet/wiki/Module_Standards]
class ejabberd::common {

    # Load the variables used in this module. Check the ejabberd-params.pp file
    require ejabberd::params

    # Configuration file
    file { $ejabberd::params::configdir:
        ensure  => 'directory',
        owner   => $ejabberd::params::configdir_owner,
        group   => $ejabberd::params::configdir_group,
        mode    => $ejabberd::params::configdir_mode,
        require => Package['ejabberd'],
    }

    file { $ejabberd::params::configfile:
        ensure  => $ejabberd::ensure,
        path    => $ejabberd::params::configfile,
        owner   => $ejabberd::params::configfile_owner,
        group   => $ejabberd::params::configfile_group,
        mode    => $ejabberd::params::configfile_mode,
        content => template('ejabberd/ejabberd.cfg.erb'),
        require =>  [
                    File[$ejabberd::params::configdir],
                    Package['ejabberd']
                    ],
        notify  => Service[$ejabberd::params::servicename]
    }

    # MUC Log dir
    file { $ejabberd::params::muc_log_dir:
        ensure  => 'directory',
        owner   => $ejabberd::params::muc_log_dir_owner,
        group   => $ejabberd::params::muc_log_dir_group,
        mode    => $ejabberd::params::muc_log_dir_mode,
        require => Package['ejabberd'],
    }


    service { 'ejabberd':
        ensure  => running,
        name    => $ejabberd::params::servicename,
        enable  => true,
        status  => "service $ejabberd::params::servicename live",
        require => [
                    Package['ejabberd'],
                    File[$ejabberd::params::configfile],
                    File[$ejabberd::params::muc_log_dir],
                    ],
    }

    package { 'ejabberd':
        ensure => $ejabberd::ensure,
        name   => $ejabberd::params::packagename,
    }

}
