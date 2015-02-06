#
# == Class: spideroak::install
#
# Install SpiderOak backup tool
#
class spideroak::install inherits spideroak::params {

    package { 'spideroak-spideroak':
        name => 'spideroak',
        ensure => installed,
        require => Class['spideroak::aptrepo'],
    }

}
