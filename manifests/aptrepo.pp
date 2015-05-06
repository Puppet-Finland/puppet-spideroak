#
# == Class: spideroak::aptrepo
#
# Setup SpiderOak apt repository. This class depends on the "puppetlabs/apt" 
# puppet module:
#
# <https://forge.puppetlabs.com/puppetlabs/apt>
#
class spideroak::aptrepo inherits spideroak::params {

    include ::apt

    apt::source { 'spideroak-aptrepo':
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
