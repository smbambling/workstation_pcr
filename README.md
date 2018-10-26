## Prep Steps

Bolt needs to be installed on the system via a package NOT Gem
Puppet Agent needs to be installed on the system ( This needs wrapped into the plan )

## Dependancies

Bolt has similar functions to R10k and can fetch any required modules from your Puppetfile.
To do this run `bolt puppetfile install`

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

## Debug

You can run puppet apply locally with the following command to trouble shoot

```
puppet apply --hiera_config hiera.yaml --modulepath=site:modules manifests/site.pp --debug
```

## References

https://github.com/halyard/puppet-osx

https://github.com/alexharv074/mac/blob/master/mac.pp

https://github.com/blakejakopovic/puppet-workstation
