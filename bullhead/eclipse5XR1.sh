#Author: xSilas43
#Credits: Formulas & Ideas - SoniCron, Awesome Scripts - Alcolawl
#Device: bullhead
#Codename: eclipse
#Build: stable
#Version: R1
#Updated 28/02/2016
#Notes: Please give credit when using this in your work!

echo PLEASE RUN THE SCRIPT WITH THE 'sh' COMMAND OR YOU WILL GET ERRORS

echo ----------------------------------------------------------
echo start 'eclipse5X'
echo ----------------------------------------------------------

echo Set IO Scheduler and Read ahead value

echo sioplus > /sys/block/mmcblk0/queue/scheduler
echo 1024 > /sys/block/mmcblk0/queue/read_ahead_kb

#turn on all cores
chmod 644 /sys/devices/system/cpu/online
echo 0-5 > /sys/devices/system/cpu/online
chmod 444 /sys/devices/system/cpu/online
echo 1 > /sys/devices/system/cpu/cpu0/online
echo 1 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu2/online
echo 1 > /sys/devices/system/cpu/cpu3/online
echo 1 > /sys/devices/system/cpu/cpu4/online
echo 1 > /sys/devices/system/cpu/cpu5/online

#Little Settings
echo Applying settings to LITTLE CPU 384 mhz min - 1440mhz max
#Set Interactive gov
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo 1440000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
#Tweak Interactive Governor
echo 95 384000:72 460000:69 600000:80 672000:76 787000:81 864000:81 960000:69 1248000:78 1440000:400 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo -1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack
echo 960000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 40000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 40000 960000:20000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 375 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 85000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse_duration
#Big Settings
echo Applying settings to big CPU 633mhz min - 1824mhz max
#Set Interactive gov
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo 633000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
echo 1824000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
#Tweak Interactive Governor
echo 95 633000:74 768000:80 864000:81 960000:69 1248000:83 1344000:84 1440000:84 1536000:84 1632000:86 1689000:83 1824000:100 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo -1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack
echo 633000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 50000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 50000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 75 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 75000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/boostpulse_duration
echo Enable LITTLE CPU Input Boost @ 787mhz for 40ms
echo 1 > /sys/module/cpu_boost/parameters/input_boost_enabled
echo 0:787000 1:787000 2:787000 3:787000 4:0 5:0 > /sys/module/cpu_boost/parameters/input_boost_freq
echo 0 > /sys/module/cpu_boost/parameters/boost_ms
echo 40 > /sys/module/cpu_boost/parameters/input_boost_ms

echo Finishing up
echo Disable touchboost
echo 0 > /sys/module/msm_performance/parameters/touchboost
#Disabling Core Control and enabling Thermal Throttling
echo 0 > /sys/module/msm_thermal/core_control/enabled
echo Y > /sys/module/msm_thermal/parameters/enabled
echo -------------------------------------------------------------------------------------------------------------------------------------
echo Finished executing the script,
echo if there were any errors let xSilas43 know.
echo You can now tweak to your liking and save it as a profile in your prefered Kernel Tweaking App
echo if you get an error on line 81, please enable input boost manually.
echo -------------------------------------------------------------------------------------------------------------------------------------
