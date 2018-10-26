# Public: Set a system config option with the OS X defaults system
# https://github.com/halyard/puppet-boxen/

define profile::osx_defaults(
  $ensure      = 'present',
  $host        = undef,
  $domain      = undef,
  $key         = undef,
  $value       = undef,
  $user        = undef,
  $type        = undef,
  $refreshonly = undef,
) {
  $defaults_cmd  = '/usr/bin/defaults'
  $default_cmds  = $host ? {
    'currentHost' => [ $defaults_cmd, '-currentHost' ],
    undef         => [ $defaults_cmd ],
    default       => [ $defaults_cmd, '-host', $host ]
  }

  case $ensure {
    present: {
      if ($domain == undef) or ($key == undef) or ($value == undef) {
        fail('Cannot ensure present without domain, key, and value attributes')
      }

      if (($type == undef) and (($value == true) or ($value == false))) or
        (($type == 'bool') or $type == 'boolean') {
        $type_ = 'bool'
        $checkvalue = bool2num($value)
      } else {
        $type_      = $type
        $checkvalue = $value
      }

      $value_string = $type_ ? {
        undef   => shellquote(strip("${value} ")),
        'dict'  => "-dict ${value}",
        default => shellquote("-${type_}", strip("${value} "))
      }
      $write_stub = shellquote($default_cmds, 'write', $domain, $key)
      $write_cmd = "${write_stub} ${value_string}"

      $read_cmd = shellquote($default_cmds, 'read', $domain, $key)

      $readtype_cmd = shellquote($default_cmds, 'read-type', $domain, $key)
      $checktype = $type_ ? {
        /^bool$/ => 'boolean',
        /^int$/  => 'integer',
        /^dict$/ => 'dictionary',
        default  => $type_
      }
      $checktype_cmd = $type_ ? {
        undef   => '',
        default => join([
          " && (${readtype_cmd} | ",
          "awk '/^Type is / { exit \$3 != \"${checktype}\" } { exit 1 }')"])
      }

      $refreshonly_ = $refreshonly ? {
        undef   => false,
        default => true,
      }

      exec { "osx_defaults write ${host} ${domain}:${key}=>${value}":
        command     => $write_cmd,
        unless      => join([
          "${read_cmd} && (${read_cmd} | ",
          "awk '{ exit \$0 != \"${checkvalue}\" }')${checktype_cmd}"]),
        user        => $user,
        refreshonly => $refreshonly_
      }
    } # end present

    default: {
      $list_cmd   = shellquote($default_cmds, 'read', $domain)
      $key_search = shellquote('grep', $key)

      exec { "osx_defaults delete ${host} ${domain}:${key}":
        command => shellquote($default_cmds, 'delete', $domain, $key),
        onlyif  => "${list_cmd} | ${key_search}",
        user    => $user
      }
    } # end default
  }
}
