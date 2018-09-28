# == Overview: Work Laptop Management
#
# == Notes:

class role::worktop {

  contain profile::base
  contain profile::system_global_packages
  contain profile::macos_fonts
  contain profile::homebrew

  Class['profile::base'] ->
  Class['profile::system_global_packages'] ->
  Class['profile::macos_fonts'] ->
  Class['profile::homebrew']

}
