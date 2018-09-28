# == Overview: Install/Manage Homebrew
#
# == Notes:

class profile::homebrew (){

  Package <| provider == tap |> -> Package <| provider == homebrew |>
  Package <| provider == tap |> -> Package <| provider == brew |>
  Package <| provider == tap |> -> Package <| provider == brewcask |>

  class { 'homebrew':
    user => 'smbambling',
  }

  $homebrew_taps = lookup('homebrew_taps', "default_value"                             => [])

  package { $homebrew_taps:
    ensure   => present,
    provider =>  tap,
  }

  $homebrew_installed_packages = lookup('homebrew_installed_packages', "default_value" => [])

  package { $homebrew_installed_packages:
    ensure   => present,
    provider =>  homebrew,
  }

  $homebrew_cask_apps = lookup('homebrew_cask_apps', "default_value" => [])

  package { $homebrew_cask_apps:
    ensure   => present,
    provider => brewcask,
  }

}
