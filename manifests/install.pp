#
# == Class: spideroak::install
#
# Install SpiderOak backup tool
#
class spideroak::install inherits spideroak::params {

    package { 'spideroak-spideroak':
        ensure  => installed,
        name    => 'spideroak',
        require => Class['spideroak::aptrepo'],
    }

}
