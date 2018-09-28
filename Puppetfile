#!/usr/bin/env ruby
#^syntax detection

# Puppet Forge URL
# This can be an internal forge also if required (https://github.com/drrb/puppet-library)
forge "https://forgeapi.puppetlabs.com"

# use dependencies defined in metadata.json
#metadata

# use dependencies defined in Modulefile
# modulefile

# Set the 'environment' from the Puppetfile basedir using the r10k
# libraian class.
# https://github.com/puppetlabs/r10k/blob/master/lib/r10k/puppetfile.rb

mod 'stdlib',
  :git => 'https://github.com/puppetlabs/puppetlabs-stdlib.git',
  :ref => '5.0.0'

mod 'vcsrepo',
  :git => 'https://github.com/puppetlabs/puppetlabs-vcsrepo.git',
  :ref => '2.3.0'

mod 'homebrew',
  :git => 'https://github.com/TheKevJames/puppet-homebrew.git',
  :ref => 'aed262c' # branch: master

mod 'archive',
  :git => 'https://github.com/voxpupuli/puppet-archive.git',
  :ref => 'v3.2.0'

mod 'wget',
  :git => 'https://github.com/voxpupuli/puppet-wget.git',
  :ref => 'b871d25' # branch: master
