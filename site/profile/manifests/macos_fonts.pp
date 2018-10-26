# == Overview: Install Fonts for macOS
#
# == Notes:

class profile::macos_fonts (){

  $macos_fonts = lookup('macos_fonts', "default_value" =>  [])

  $macos_fonts_defaults = {
    'extract'      => true,
    'extract_path' => '/Library/Fonts',
    'cleanup'      =>  true,
  }

  if !empty($macos_fonts) {
    create_resources(archive, $macos_fonts, $macos_fonts_defaults)
  }

}
