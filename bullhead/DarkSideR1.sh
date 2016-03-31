#Author: xSilas43
#Credits: Ideas - SoniCron, Awesome Scripts - Alcolawl, The Best Kernel and Governor - DespairFactor
#Device: bullhead
#Codename: DarkSide
#Build: stable
#Version: R1
#Updated 30/03/2016
#Notes: Please give credit when using this in your work!

echo PLEASE RUN THE SCRIPT WITH THE 'sh' COMMAND OR YOU WILL GET ERRORS

echo ----------------------------------------------------------
echo start 'DarkSide'
echo ----------------------------------------------------------

echo Set IO Scheduler and Read ahead value

echo bfq > /sys/block/mmcblk0/queue/scheduler
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
echo Applying settings to LITTLE CPU 384 mhz min - 1444 mhz max
#Set Despair gov
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo despair > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo 1444000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
#Tweak Despair Governor
echo 50 > /sys/devices/system/cpu/cpu0/cpufreq/despair/down_threshold
echo 2000 > /sys/devices/system/cpu/cpu0/cpufreq/despair/sampling_rate
echo 95 > /sys/devices/system/cpu/cpu0/cpufreq/despair/up_threshold
echo 65 > /sys/devices/system/cpu/cpu0/cpufreq/despair/twostep_threshold
echo 5 > /sys/devices/system/cpu/cpu0/cpufreq/despair/freq_step
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/despair/sampling_down_factor
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/despair/ignore_nice_load
echo 65 > /sys/devices/system/cpu/cpu4/cpufreq/despair/down_threshold
#Big Settings
echo Applying settings to big CPU 633mhz min - 1824mhz max
#Set Despair gov
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo despair > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo 633000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
echo 1824000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
#Tweak Despair Governor
echo 65 > /sys/devices/system/cpu/cpu4/cpufreq/despair/down_threshold
echo 20000 > /sys/devices/system/cpu/cpu4/cpufreq/despair/sampling_rate
echo 95 > /sys/devices/system/cpu/cpu4/cpufreq/despair/up_threshold
echo 75 > /sys/devices/system/cpu/cpu4/cpufreq/despair/twostep_threshold
echo 5 > /sys/devices/system/cpu/cpu4/cpufreq/despair/freq_step
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/despair/sampling_down_factor
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/despair/ignore_nice_load

echo Enable inputboost @ 960mhz for 40ms
echo 0:960000 1:960000 2:960000 3:960000 4:0 5:0 > /sys/module/cpu_boost/parameters/input_boost_freq
echo 0 > /sys/module/cpu_boost/parameters/boost_ms
echo 40 > /sys/module/cpu_boost/parameters/input_boost_ms
echo 1 > /sys/module/cpu_boost/parameters/input_boost_enabled

echo Finishing up
echo Disable touchboost
echo 0 > /sys/module/msm_performance/parameters/touchboost

echo Disabling Core Control and Thermal Throttling for best performance
echo 0 > /sys/module/msm_thermal/core_control/enabled
echo N > /sys/module/msm_thermal/parameters/enabled
echo -------------------------------------------------------------------------------------------------------------------------------------
echo Finished executing the script,
echo if there were any errors let xSilas43 know.
echo You can now tweak to your liking and save it as a profile in your prefered Kernel Tweaking App.
echo -------------------------------------------------------------------------------------------------------------------------------------
