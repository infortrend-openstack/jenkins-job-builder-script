#!/bin/bash -ex

declare -i fc_data_link=`ssh ift@fc 'java -jar raidcmd_ESDS10.jar 10.10.10.200 show channel' | grep Serial | wc -l`
declare -i iscsi_data_link=`ssh ift@iscsi 'java -jar raidcmd_ESDS10.jar 10.10.10.200 show channel' | grep 'Full Duplex' | wc -l`
RET_BAD=0

if [ "$fc_data_link" -ne "2" ]; then
    echo "FC Slave    Link loss, please check fc cable!!"
    RET_BAD=1
else
    echo "FC Slave    Link is good"
fi


if [ "$iscsi_data_link" -ne "2" ]; then
    echo "ISCSI Slave Link loss, please check iscsi cable!!"
    RET_BAD=1
else
    echo "ISCSI Slave Link is good"
fi

exit $RET_BAD


