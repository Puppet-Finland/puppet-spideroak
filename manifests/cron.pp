#
# == Define: spideroak::cron
#
# Run SpiderOak in batchmode from cron
#
# == Parameters
#
# [*status*]
#   Status of the cronjob. Either 'present' or 'absent'. Defaults to 'present'.
# [*user*]
#   User to run this command as. This will not only affect privileges but also 
#   which SpiderOak configuration is loaded. Defaults to 'root'.
# [*hour*]
#   Hour(s) when spideroak gets run. Defaults to 12.
# [*minute*]
#   Minute(s) when spideroak gets run. Defaults to 0.
# [*weekday*]
#   Weekday(s) when spideroak gets run. Defaults to * (all weekdays).
# [*suppress_output*]
#   Suppress all output. It seems that SpiderOak always returns a zero and never 
#   outputs anything to STDERR. This means that we either email the full output 
#   (-v flag) or don't send any emails at all. Valid values 'true' and 'false'. 
#   The default value is 'true'.
# [*email*]
#   Email address where notifications are sent. Defaults to top-scope variable
#   $::servermonitor.
#
# == Examples
#
#   spideroak::cron { 'joe-daily':
#       user => 'joe',
#       email => 'joe@domain.com',
#   }
#
define spideroak::cron
(
    $status = 'present',
    $user = 'root',
    $hour = '12',
    $minute = '0',
    $weekday = '*',
    $suppress_output = 'true',
    $email = $::servermonitor
)
{

    $base_command = 'SpiderOak --batchmode -v'

    if $suppress_output == 'true' {
        $cron_command = "${base_command} > /dev/null"
    } else {
        $cron_command = "${base_command}"
    }

    cron { "spideroak-${title}-cron":
        ensure => $status,
        command => $cron_command,
        user => $user,
        hour => $hour,
        minute => $minute,
        weekday => $weekday,
        environment => "MAILTO=${email}",
    }
}
