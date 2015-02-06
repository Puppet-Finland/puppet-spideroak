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
# [*manage*]
#   Whether to manage SpiderOak using this class or not. Valid values 'yes' 
#   (default) and 'no'.
# [*crons*]
#   A hash of spideroak::cron parameters to realize.
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
(
    $manage = 'yes',
    $crons = {}
)
{

if $manage == 'yes' {

    include spideroak::aptrepo
    include spideroak::install

    create_resources('spideroak::cron', $crons)
}
}
