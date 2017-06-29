# Class: dovecot::params
#
# This class defines default parameters used by the main module class dovecot
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to dovecot class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class dovecot::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => [ 'dovecot-imapd','dovecot-pop3d' ],
    /(?i:FreeBSD)/            => [ 'dovecot2', 'dovecot-pigeonhole' ],
    default                   => 'dovecot',
  }

  $service = $::operatingsystem ? {
    default => 'dovecot',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'dovecot',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'dovecot',
  }

  $config_dir = $::operatingsystem ? {
    /(?i:FreeBSD)/ => '/usr/local/etc/dovecot',
    default        => '/etc/dovecot',
  }

  $config_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint|RedHat|CentOS|Scientific)/ => '/etc/dovecot/dovecot.conf',
    /(?i:FreeBSD)/            => '/usr/local/etc/dovecot/dovecot.conf',
    default                   => '/etc/dovecot.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    /(?i:FreeBSD)/ => 'wheel',
    default        => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/dovecot',
    default                   => '/etc/sysconfig/dovecot',
  }

  $pid_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/var/run/dovecot/master.pid',
    default                   => '/var/run/dovecot.pid',
  }

  $data_dir = $::operatingsystem ? {
    /(?i:FreeBSD)/ => '/usr/local/etc/dovecot',
    default       => '/etc/dovecot',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/dovecot',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/dovecot/dovecot.log',
  }

  $port = '143'
  $enable_pop3 = false
  $pop3_port = '110'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = undef
  $source_dir = false
  $source_dir_purge = false
  $template = undef
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
