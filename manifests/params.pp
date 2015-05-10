#
# == Class: spideroak::params
#
# Defines some variables based on the operating system
#
class spideroak::params {

    include ::os::params

    case $::operatingsystem {
        'Debian': {
            $apt_repo_location = 'http://apt.spideroak.com/debian'
            $apt_repo_release = 'stable'
            $apt_repo_repos = 'non-free'
            $package_provider = undef
            $package_source = undef
        }
        'Ubuntu': {
            $apt_repo_location = 'http://apt.spideroak.com/ubuntu-spideroak-hardy'
            $apt_repo_release = 'release'
            $apt_repo_repos = 'restricted'
            $package_provider = undef
            $package_source = undef
        }
        'Fedora': {
            $package_provider = 'rpm'
            $package_source = $::hardwaremodel ? {
                'i686'   => 'https://spideroak.com/getbuild?platform=fedora&arch=i386',
                'x86_64' => 'https://spideroak.com/getbuild?platform=fedora&arch=x86_64',
                default  => fail("Unsupported architecture ${::hardwaremode} for Fedora"),
            }
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
