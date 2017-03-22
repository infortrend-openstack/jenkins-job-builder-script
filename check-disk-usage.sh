#!/bin/bash -ex

declare -i disk_usage=`df | grep /dev/sda | awk {'print $5'} | cut -d'%' -f1`
declare -i log_usage=`df | grep /dev/sdb | awk {'print $5'} | cut -d'%' -f1`
declare -i fc_slave_usage=`ssh ift@fc 'df | grep /dev/sda' | awk {'print $5'} | cut -d'%' -f1`
declare -i iscsi_slave_usage=`ssh ift@iscsi 'df | grep /dev/sda' | awk {'print $5'} | cut -d'%' -f1`

RET_BAD=0

if [ "$disk_usage" -gt "50" ]; then
    echo "Master node Disk usage $disk_usage%, it's over 50%, please check!"
    RET_BAD=1
else
    echo "Master node Disk usage $disk_usage%"
fi

if [ "$log_usage" -gt "70" ]; then
    echo "Master node Log usage $log_usage%, it's over 70%, please clean!"
    RET_BAD=1
else
    echo "Master node Log usage $log_usage%"
fi

if [ "$fc_slave_usage" -gt "40" ]; then
    echo "FC Slave    Disk usage $fc_slave_usage%, it's over 40%, please check!"
    RET_BAD=1
else
    echo "FC Slave    Disk usage $fc_slave_usage%"
fi

if [ "$iscsi_slave_usage" -gt "40" ]; then
    echo "ISCSI Slave Disk usage $iscsi_slave_usage%, it's over 40%, please check!"
    RET_BAD=1
else
    echo "ISCSI Slave Disk usage $iscsi_slave_usage%"
fi

exit $RET_BAD

