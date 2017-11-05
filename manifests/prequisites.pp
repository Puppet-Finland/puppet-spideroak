#
# == Class: spideroak::prequisites
#
# Setup SpiderOak apt repository if on Debian. This class depends on the 
# "puppetlabs/apt" puppet module:
#
# <https://forge.puppetlabs.com/puppetlabs/apt>
#
class spideroak::prequisites inherits spideroak::params {

    if $::osfamily == 'Debian' {

        include ::apt

        apt::source { 'spideroak-prequisites':
            ensure   => 'present',
            location => $::spideroak::params::apt_repo_location,
            release  => $::spideroak::params::apt_repo_release,
            repos    => $::spideroak::params::apt_repo_repos,
            pin      => 501,
            key      => {
                'id'     => '98B1C72BC780EB0A208ACF1F573E3D1C51AE1B3D',
                'server' => 'keyserver.ubuntu.com',
            },
        }
    }
}
