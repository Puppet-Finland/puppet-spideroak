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
                'id'     => 'FE45E5330B11DCF03247EF49A6FF22FF08C15DD0',
                'source' => 'https://spideroak.com/dist/spideroak-apt-2013.asc',
            },
        }
    }
}
