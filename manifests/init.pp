#
# == Class: spideroak
#
# Install and configure SpiderOak backup tool. This module depends on the 
# "puppetlabs/apt" module.
#
# <https://forge.puppetlabs.com/puppetlabs/apt>
#
# == Parameters
#
# None at the moment
#
# == Examples
#
#   include spideroak
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class spideroak
{

# Rationale for this is explained in init.pp of the sshd module
if hiera('manage_spideroak', 'true') != 'false' {
    include spideroak::aptrepo
    include spideroak::install
}
}
