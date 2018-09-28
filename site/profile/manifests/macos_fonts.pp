# == Overview: Install Fonts for macOS
#
# == Notes:

class profile::macos_fonts (){

  archive { 'Hack Font':
    path         => '/tmp/Hack-v3.003-ttf.zip',
    source       => 'https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip',
    extract      => true,
    extract_path => '/tmp',
    cleanup      => true,
  }

}
