#
# Author:: Tim Smith <tsmith@limelight.com>
# Cookbook Name:: nagios
# Attributes:: nagios_config
#
# Copyright 2013-2014 Limelight Networks Inc
#
# Licensed under the Apache License Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing software
# distributed under the License is distributed on an "AS IS" BASIS
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# LOG ROTATION METHOD
# This is the log rotation method that Nagios should use to rotate
# the main log file. Values are as follows..
# n = None - don't rotate the log
# h = Hourly rotation (top of the hour)
# d = Daily rotation (midnight every day)
# w = Weekly rotation (midnight on Saturday evening)
# m = Monthly rotation (midnight last day of month)
default['nagios']['conf']['log_rotation_method'] = 'd'

# LOG ARCHIVE PATH
# This is the directory where archived (rotated) log files should be
# placed (assuming you've chosen to do log rotation).
default['nagios']['conf']['log_archive_path'] = "#{node['nagios']['log_dir']}/archives"

# LOGGING OPTIONS
# If you want messages logged to the syslog facility, as well as the
# Nagios log file set this option to 1.  If not, set it to 0.
default['nagios']['conf']['use_syslog'] = 1

# NOTIFICATION LOGGING OPTION
# If you don't want notifications to be logged, set this value to 0.
# If notifications should be logged, set the value to 1.
default['nagios']['conf']['log_notifications'] = 1

# SERVICE RETRY LOGGING OPTION
# If you don't want service check retries to be logged, set this value
# to 0.  If retries should be logged, set the value to 1.
default['nagios']['conf']['log_service_retries'] = 1

# HOST RETRY LOGGING OPTION
# If you don't want host check retries to be logged, set this value to
# 0.  If retries should be logged, set the value to 1.
default['nagios']['conf']['log_host_retries'] = 1

# EVENT HANDLER LOGGING OPTION
# If you don't want host and service event handlers to be logged, set
# this value to 0.  If event handlers should be logged, set the value
# to 1.
default['nagios']['conf']['log_event_handlers'] = 1

# INITIAL STATES LOGGING OPTION
# If you want Nagios to log all initial host and service states to
# the main log file (the first time the service or host is checked)
# you can enable this option by setting this value to 1.  If you
# are not using an external application that does long term state
# statistics reporting, you do not need to enable this option.  In
# this case, set the value to 0.
default['nagios']['conf']['log_initial_states'] = 0

# EXTERNAL COMMANDS LOGGING OPTION
# If you don't want Nagios to log external commands, set this value
# to 0.  If external commands should be logged, set this value to 1.
# Note: This option does not include logging of passive service
# checks - see the option below for controlling whether or not
# passive checks are logged.
default['nagios']['conf']['log_external_commands'] = 1

# PASSIVE CHECKS LOGGING OPTION
# If you don't want Nagios to log passive host and service checks, set
# this value to 0.  If passive checks should be logged, set
# this value to 1.
default['nagios']['conf']['log_passive_checks'] = 1

# GLOBAL HOST AND SERVICE EVENT HANDLERS
# These options allow you to specify a host and service event handler
# command that is to be run for every host or service state change.
# The global event handler is executed immediately prior to the event
# handler that you have optionally specified in each host or
# service definition. The command argument is the short name of a
# command definition that you define in your host configuration file.
# Read the HTML docs for more information.
default['nagios']['conf']['global_host_event_handler'] = nil
default['nagios']['conf']['global_service_event_handler'] = nil

# SERVICE INTER-CHECK DELAY METHOD
# This is the method that Nagios should use when initially
# "spreading out" service checks when it starts monitoring.  The
# default is to use smart delay calculation, which will try to
# space all service checks out evenly to minimize CPU load.
# Using the dumb setting will cause all checks to be scheduled
# at the same time (with no delay between them)!  This is not a
# good thing for production, but is useful when testing the
# parallelization functionality.
# n = None - don't use any delay between checks
# d = Use a "dumb" delay of 1 second between checks
# s = Use "smart" inter-check delay calculation
#       x.xx    = Use an inter-check delay of x.xx seconds
default['nagios']['conf']['service_inter_check_delay_method'] = 's'

# MAXIMUM SERVICE CHECK SPREAD
# This variable determines the timeframe (in minutes) from the
# program start time that an initial check of all services should
# be completed.  Default is 30 minutes.
default['nagios']['conf']['max_service_check_spread'] = 5

# SERVICE CHECK INTERLEAVE FACTOR
# This variable determines how service checks are interleaved.
# Interleaving the service checks allows for a more even
# distribution of service checks and reduced load on remote
# hosts.  Setting this value to 1 is equivalent to how versions
# of Nagios previous to 0.0.5 did service checks.  Set this
# value to s (smart) for automatic calculation of the interleave
# factor unless you have a specific reason to change it.
#       s       = Use "smart" interleave factor calculation
#       x       = Use an interleave factor of x, where x is a
#                 number greater than or equal to 1.

default['nagios']['conf']['service_inter_check_delay_method'] = 's'

# HOST INTER-CHECK DELAY METHOD
# This is the method that Nagios should use when initially
# "spreading out" host checks when it starts monitoring.  The
# default is to use smart delay calculation, which will try to
# space all host checks out evenly to minimize CPU load.
# Using the dumb setting will cause all checks to be scheduled
# at the same time (with no delay between them)!
# n = None - don't use any delay between checks
# d = Use a "dumb" delay of 1 second between checks
# s = Use "smart" inter-check delay calculation
#       x.xx    = Use an inter-check delay of x.xx seconds
default['nagios']['conf']['host_inter_check_delay_method'] = 's'

# MAXIMUM HOST CHECK SPREAD
# This variable determines the timeframe (in minutes) from the
# program start time that an initial check of all hosts should
# be completed.  Default is 30 minutes.
default['nagios']['conf']['max_host_check_spread'] = 5

# SERVICE CHECK INTERLEAVE FACTOR
# This variable determines how service checks are interleaved.
# Interleaving the service checks allows for a more even
# distribution of service checks and reduced load on remote
# hosts.  Setting this value to 1 is equivalent to how versions
# of Nagios previous to 0.0.5 did service checks.  Set this
# value to s (smart) for automatic calculation of the interleave
# factor unless you have a specific reason to change it.
#       s       = Use "smart" interleave factor calculation
#       x       = Use an interleave factor of x, where x is a
#                 number greater than or equal to 1.
default['nagios']['conf']['service_interleave_factor'] = 's'

# MAXIMUM CONCURRENT SERVICE CHECKS
# This option allows you to specify the maximum number of
# service checks that can be run in parallel at any given time.
# Specifying a value of 1 for this variable essentially prevents
# any service checks from being parallelized.  A value of 0
# will not restrict the number of concurrent checks that are
# being executed.
default['nagios']['conf']['max_concurrent_checks'] = 0

# HOST AND SERVICE CHECK REAPER FREQUENCY
# This is the frequency (in seconds!) that Nagios will process
# the results of host and service checks.
default['nagios']['conf']['check_result_reaper_frequency'] = 10

# MAX CHECK RESULT REAPER TIME
# This is the max amount of time (in seconds) that  a single
# check result reaper event will be allowed to run before
# returning control back to Nagios so it can perform other
# duties.
default['nagios']['conf']['max_check_result_reaper_time'] = 30

# CHECK RESULT PATH
# This is directory where Nagios stores the results of host and
# service checks that have not yet been processed.
#
# Note: Make sure that only one instance of Nagios has access
# to this directory!
default['nagios']['conf']['check_result_path'] = "#{node['nagios']['state_dir']}/spool/checkresults"

# MAX CHECK RESULT FILE AGE
# This option determines the maximum age (in seconds) which check
# result files are considered to be valid.  Files older than this
# threshold will be mercilessly deleted without further processing.
default['nagios']['conf']['max_check_result_file_age'] = 3600

# CACHED HOST CHECK HORIZON
# This option determines the maximum amount of time (in seconds)
# that the state of a previous host check is considered current.
# Cached host states (from host checks that were performed more
# recently that the timeframe specified by this value) can immensely
# improve performance in regards to the host check logic.
# Too high of a value for this option may result in inaccurate host
# states being used by Nagios, while a lower value may result in a
# performance hit for host checks.  Use a value of 0 to disable host
# check caching.
default['nagios']['conf']['cached_host_check_horizon'] = 15

# CACHED SERVICE CHECK HORIZON
# This option determines the maximum amount of time (in seconds)
# that the state of a previous service check is considered current.
# Cached service states (from service checks that were performed more
# recently that the timeframe specified by this value) can immensely
# improve performance in regards to predictive dependency checks.
# Use a value of 0 to disable service check caching.
default['nagios']['conf']['cached_service_check_horizon'] = 15

# ENABLE PREDICTIVE HOST DEPENDENCY CHECKS
# This option determines whether or not Nagios will attempt to execute
# checks of hosts when it predicts that future dependency logic test
# may be needed.  These predictive checks can help ensure that your
# host dependency logic works well.
# Values:
#  0 = Disable predictive checks
#  1 = Enable predictive checks (default)
default['nagios']['conf']['enable_predictive_host_dependency_checks'] = 1

# ENABLE PREDICTIVE SERVICE DEPENDENCY CHECKS
# This option determines whether or not Nagios will attempt to execute
# checks of service when it predicts that future dependency logic test
# may be needed.  These predictive checks can help ensure that your
# service dependency logic works well.
# Values:
#  0 = Disable predictive checks
#  1 = Enable predictive checks (default)
default['nagios']['conf']['enable_predictive_service_dependency_checks'] = 1

# SOFT STATE DEPENDENCIES
# This option determines whether or not Nagios will use soft state
# information when checking host and service dependencies. Normally
# Nagios will only use the latest hard host or service state when
# checking dependencies. If you want it to use the latest state (regardless
# of whether its a soft or hard state type), enable this option.
# Values:
#  0 = Don't use soft state dependencies (default)
#  1 = Use soft state dependencies
default['nagios']['conf']['soft_state_dependencies'] = 0

default['nagios']['conf']['auto_reschedule_checks'] = 0
default['nagios']['conf']['auto_rescheduling_interval'] = 30
default['nagios']['conf']['auto_rescheduling_window'] = 180

default['nagios']['conf']['sleep_time'] = 0.25
default['nagios']['conf']['service_check_timeout'] = 60
default['nagios']['conf']['host_check_timeout'] = 30
default['nagios']['conf']['event_handler_timeout'] = 30
default['nagios']['conf']['notification_timeout'] = 30
default['nagios']['conf']['ocsp_timeout'] = 5
default['nagios']['conf']['perfdata_timeout'] = 5

default['nagios']['conf']['retain_state_information'] = 1
default['nagios']['conf']['state_retention_file'] = "#{node['nagios']['state_dir']}/retention.dat"
default['nagios']['conf']['retention_update_interval'] = 60
default['nagios']['conf']['use_retained_program_state'] = 1
default['nagios']['conf']['use_retained_scheduling_info'] = 1
default['nagios']['conf']['retained_host_attribute_mask'] = 0
default['nagios']['conf']['retained_service_attribute_mask'] = 0
default['nagios']['conf']['retained_process_host_attribute_mask'] = 0
default['nagios']['conf']['retained_process_service_attribute_mask'] = 0
default['nagios']['conf']['retained_contact_host_attribute_mask'] = 0
default['nagios']['conf']['retained_contact_service_attribute_mask'] = 0

default['nagios']['conf']['interval_length'] = 1

default['nagios']['conf']['use_aggressive_host_checking'] = 0

default['nagios']['conf']['process_performance_data'] = 0

default['nagios']['conf']['execute_service_checks'] = 1
default['nagios']['conf']['accept_passive_service_checks'] = 1
default['nagios']['conf']['execute_host_checks'] = 1
default['nagios']['conf']['accept_passive_host_checks'] = 1

default['nagios']['conf']['enable_notifications'] = 0
default['nagios']['conf']['enable_event_handlers'] = 1

default['nagios']['conf']['obsess_over_services'] = 0
default['nagios']['conf']['obsess_over_hosts'] = 0
default['nagios']['conf']['translate_passive_host_checks'] = 0
default['nagios']['conf']['passive_host_checks_are_soft'] = 0
default['nagios']['conf']['check_for_orphaned_services'] = 1
default['nagios']['conf']['check_for_orphaned_hosts'] = 1
default['nagios']['conf']['check_service_freshness'] = 1
default['nagios']['conf']['service_freshness_check_interval'] = 60
default['nagios']['conf']['check_host_freshness'] = 0
default['nagios']['conf']['host_freshness_check_interval'] = 60
default['nagios']['conf']['additional_freshness_latency'] = 15

default['nagios']['conf']['enable_flap_detection'] = 1
default['nagios']['conf']['low_service_flap_threshold'] = 5.0
default['nagios']['conf']['high_service_flap_threshold'] = 20.0
default['nagios']['conf']['low_host_flap_threshold'] = 5.0
default['nagios']['conf']['high_host_flap_threshold'] = 20.0

default['nagios']['conf']['date_format'] = 'iso8601'
default['nagios']['conf']['use_timezone'] = node['nagios']['timezone']

default['nagios']['conf']['debug_level'] = 0
default['nagios']['conf']['debug_verbosity'] = 1
default['nagios']['conf']['debug_file'] = "#{node['nagios']['state_dir']}/#{node['nagios']['server']['name']}.debug"
default['nagios']['conf']['max_debug_file_size'] = 1000000
