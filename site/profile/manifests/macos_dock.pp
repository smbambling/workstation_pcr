# == Overview: 'Default' configuration settings that are applied to ALL nodes
#
# == Requirements:
#
# == Notes:

class profile::macos_dock (){

  profile::osx_defaults { 'Automatically hide the dock':
    user   => $facts['identity']['user'],
    key    => 'autohide',
    domain => 'com.apple.dock',
    value  => true,
    notify => Exec['killall Dock'];
  }

  # Set the Dock Size
  profile::osx_defaults { 'magnification_size':
    domain => 'com.apple.dock',
    key    => 'tilesize',
    type   => int,
    value  => '128',
    user   => $facts['identity']['user'],
    notify => Exec['killall Dock'];
  }

  exec { 'killall Dock':
    path        => '/usr/bin',
    refreshonly => true
  }

}
