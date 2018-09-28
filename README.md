## Prep Steps

Bolt needs to be installed on the system via a package NOT Gem
Puppet Agent needs to be installed on the system ( This needs wrapped into the plan )

## Use Puppet Bolt to apply a role locally
```
bolt plan run role::worktop nodes=localhost

or 

bolt plan run role::worktop nodes=localhost --sudo-password --run-as root
```

Hiera-eyaml needs to be installed for bolt not for the system

Reference: https://puppet.com/docs/bolt/0.x/manifest_blocks_hiera.html

```
/opt/puppetlabs/bolt/bin/gem install hiera-eyaml
```
