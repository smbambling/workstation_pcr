# == Overview: Work Laptop Management
#
# == Notes:

class role::worktop {

  contain profile::base
  contain profile::macos_fonts
  contain profile::homebrew

  Class['profile::base'] ->
  Class['profile::macos_fonts'] ->
  Class['profile::homebrew']

}
