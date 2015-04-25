#
# == Class: spideroak::aptrepo
#
# Setup SpiderOak apt repository. This class depends on the "puppetlabs/apt" 
# puppet module:
#
# <https://forge.puppetlabs.com/puppetlabs/apt>
#
class spideroak::aptrepo inherits spideroak::params {

    apt::source { 'spideroak-aptrepo':
        location          => $::spideroak::params::apt_repo_location,
        release           => $::spideroak::params::apt_repo_release,
        repos             => $::spideroak::params::apt_repo_repos,
        required_packages => undef,
        key               => '08C15DD0',
        key_source        => 'https://spideroak.com/dist/spideroak-apt-2013.asc',
        pin               => '501',
        include_src       => false
    }
}
