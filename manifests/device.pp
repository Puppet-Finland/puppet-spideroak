#
# == Define: spideroak::device
#
# Create or recreate a SpiderOak device
#
# == Parameters
#
# [*system_username*]
#   The system user to whom this device is bound to.
# [*spideroak_username*]
#   Username of the SpiderOak account.
# [*spideroak_password*]
#   Password of the SpiderOak account.
# [*reinstall*]
#   Reinstall an existing device. Valid values are true (default) and false.
# [*device_name*]
#   The name of the device, which needs to be unique. For example 
#   'server.domain.com-root' or 'desktop.domain.com-johndoe'. Defaults to 
#   $title.
#
define spideroak::device
(
    $system_username,
    $spideroak_username,
    $spideroak_password,
    $reinstall = true,
    $device_name = $title
)
{

    include ::spideroak::params

    $homedir = $system_username ? {
        'root' => '/root',
        default => "${::os::params::home}/${system_username}",
    }

    file { "spideroak-.device.json-${device_name}":
        ensure  => present,
        name    => "${homedir}/.device.json",
        content => template('spideroak/device.json.erb'),
        owner   => $system_username,
        mode    => '0600',
        require => Class['spideroak::install'],
    }

    # This command can take a lot of time, so we log its output to show the 
    # admin that something is happening.
    exec { "spideroak-setup-${device_name}":
        command     => "SpiderOak -v --setup=${homedir}/.device.json",
        path        => ['/bin', '/usr/bin'],
        creates     => "${homedir}/.config/SpiderOak",
        require     => File["spideroak-.device.json-${device_name}"],
        user        => $system_username,
        logoutput   => true,
        # SpiderOak runs can take very long time, so we don't want automatic 
        # timeouts.
        timeout     => 0,
        environment => [ "HOME=${homedir}", "USER=${system_username}", ],
    }
}
