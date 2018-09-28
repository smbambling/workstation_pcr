# == Overview: Install system global Ruby GEMs
#
# == Notes:

class profile::system_global_packages (){

  $system_global_gems = lookup('system_global_gems', "default_value" => [])

  $gem_defaults = {
    'ensure'   => present,
    'provider' => 'gem',
  }

  if ! empty($system_global_gems) {
    create_resources(package, $system_global_gems, $gem_defaults)
  }

  $system_global_pips = lookup('system_global_pips', "default_value" => [])

  $pip_defaults = {
    'ensure'   => present,
    'provider' => 'pip',
  }

  if ! empty($system_global_pips) {
    create_resources(package, $system_global_pips, $pip_defaults)
  }

}
