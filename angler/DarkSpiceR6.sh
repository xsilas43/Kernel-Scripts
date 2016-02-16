#Author: xSilas43
#Credits: Formulas & Ideas - SoniCron, Awesome Scripts - Alcolawl
#Device: angler
#Codename: DarkSpice
#Build: beta
#Version: R6
#Updated 15/02/2016
#Notes: Please give credit when using this in your work!

echo PLEASE RUN THE SCRIPT WITH THE 'sh' COMMAND OR YOU WILL GET ERRORS

echo ----------------------------------------------------------
echo start 'DarkSpice'
echo ----------------------------------------------------------

echo Set IO Scheduler and Read ahead value

echo sioplus > /sys/block/mmcblk0/queue/scheduler
echo 1024 > /sys/block/mmcblk0/queue/read_ahead_kb

#turn on all cores
chmod 644 /sys/devices/system/cpu/online
echo 0-7 > /sys/devices/system/cpu/online
chmod 444 /sys/devices/system/cpu/online
echo 1 > /sys/devices/system/cpu/cpu0/online
echo 1 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu2/online
echo 1 > /sys/devices/system/cpu/cpu3/online
echo 1 > /sys/devices/system/cpu/cpu4/online
echo 1 > /sys/devices/system/cpu/cpu5/online

#Little Settings
echo Applying settings to LITTLE CPU 384 mhz min - 1555mhz max
#Set Interactive gov
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo 1555200 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
#Tweak Interactive Governor
echo 98 384000:75 460000:30 600000:12 672000:14 768000:80 864000:11 960000:69 1248000:8 1344000:82 1478000:99 1555000:100 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo -1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack
echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 50000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 50000 672000:60000 864000:20000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 200 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 80000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse_duration
#Big Settings
echo Applying settings to big CPU 633mhz min - 1958mhz max
#Set Interactive gov
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo 633000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
echo 1958400 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
#Tweak Interactive Governor
echo 98 633000:74 768000:13 864000:11 960000:69 1248000:8 1344000:7 1440000:6 1536000:6 1632000:85 1728000:5 1824000:7 1958400:85 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo -1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack
echo 633000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 50000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 50000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 200 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 70000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/boostpulse_duration
echo Disable LITTLE CPU Input Boost
echo 0:0 1:0 2:0 3:0 4:0 5:0 6:0 7:0 > /sys/module/cpu_boost/parameters/input_boost_freq
echo 0 > /sys/module/cpu_boost/parameters/boost_ms
echo 0 > /sys/module/cpu_boost/parameters/input_boost_ms
echo 0 > /sys/module/cpu_boost/parameters/input_boost_enabled

echo Finishing up
#disable touchboot
echo 0 > /sys/module/msm_performance/parameters/touchboost

#Disabling Core Control and enabling Thermal Throttling
echo 0 > /sys/module/msm_thermal/core_control/enabled
echo Y > /sys/module/msm_thermal/parameters/enabled

echo -------------------------------------------------------------------------------------------------------------------------------------
echo Finished executing the script,
echo if there were any errors let xSilas43 know.
echo You can now tweak to your liking and save it as a profile in your prefered Kernel Tweaking App
echo -------------------------------------------------------------------------------------------------------------------------------------
