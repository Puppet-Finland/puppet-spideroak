#
# == Class: spideroak::install
#
# Install SpiderOak backup tool
#
class spideroak::install inherits spideroak::params {

    package { 'spideroak-spideroak':
        ensure   => installed,
        name     => 'spideroak',
        provider => $::spideroak::params::package_provider,
        source   => $::spideroak::params::package_source,
        require  => Class['spideroak::prequisites'],
    }

}
