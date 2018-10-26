# == Overview: 'Default' configuration settings that are applied to ALL nodes
#  - Configure Repositories
#    - ARIN 'default' internal repository
#  - Set root useres GECOS field
#
# == Requirements:
#  - bambling/yumrepo  module
#
#
# == Monitoring: No monitoring is currently provided
#
# == Notes:

class profile::base (){

  profile::osx_defaults { 'short delay for password dialog on screensaver':
    ensure => present,
    domain => 'com.apple.screensaver',
    key    => 'askForPasswordDelay',
    value  => '10',
    type   => 'float',
    user   => 'smbambling',
  }

}
