plan role::worktop(
     TargetSpec $nodes,
   ) {

     # Install the puppet-agent package if Puppet is not detected.
     # Copy over custom facts from the Bolt modulepath.
     # Run the `facter` command line tool to gather node information.
     #$nodes.apply_prep
     apply_prep($nodes)

     # Compile the manifest block into a catalog
     apply($nodes) { include 'role::worktop' }

}
