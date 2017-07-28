@echo "catch the freq of carcorder:"
@echo off
adb root
mkdir output

del %logdir%
:loop
 echo %date%  %time%
 
 echo %date%  %time% >> output/freq.txt
 echo %date%  %time% >> output/top_thread.txt
 echo %date%  %time% >> output/top_process.txt
 adb shell "top -n 1 -d 1 -m 15 -t" >> output/top_thread.txt
 adb shell "top -n 1 -d 1 -m 15" >> output/top_process.txt
 adb shell "cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq " >> output/freq.txt
 adb shell "cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq " >> output/freq.txt
 adb shell "cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_cur_freq " >> output/freq.txt
 adb shell "cat /sys/devices/system/cpu/cpu3/cpufreq/scaling_cur_freq " >> output/freq.txt
 adb shell echo "==============" >> output/freq.txt
 adb shell cat proc/mtktz/mtktscpu >> output/freq.txt
 adb shell echo "==============" >> output/freq.txt
 adb shell cat /sys/bus/platform/drivers/emi_clk_test/read_dram_data_rate  >> output/freq.txt

 
 echo "wait 1s to next catch"
 ping -n 1 127.0.0.1>nul 
 
 goto loop