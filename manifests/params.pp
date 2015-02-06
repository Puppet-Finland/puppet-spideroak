#
# == Class: spideroak::params
#
# Defines some variables based on the operating system
#
class spideroak::params {

    case $::operatingsystem {
        'Debian': {
            $apt_repo_location = 'http://apt.spideroak.com/debian'
            $apt_repo_release = 'stable'
            $apt_repo_repos = 'non-free'
        }
        'Ubuntu': {
            $apt_repo_location = 'http://apt.spideroak.com/ubuntu-spideroak-hardy'
            $apt_repo_release = 'release'
            $apt_repo_repos = 'restricted'
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
