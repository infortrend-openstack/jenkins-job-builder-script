#!/bin/bash -ex

declare -i fc_license=`ssh ift@fc 'java -jar raidcmd_ESDS10.jar 10.10.10.200 show license' | grep Expired | wc -l`
declare -i iscsi_license=`ssh ift@iscsi 'java -jar raidcmd_ESDS10.jar 10.10.10.200 show license' | grep Expired | wc -l`

declare -i fc_license_day=`ssh ift@fc 'java -jar raidcmd_ESDS10.jar 10.10.10.200 show license' | grep EonPath | awk {'print $3'}`
declare -i iscsi_license_day=`ssh ift@iscsi 'java -jar raidcmd_ESDS10.jar 10.10.10.200 show license' | grep EonPath | awk {'print $3'}`

if [ "$fc_license" -gt "1" ]; then
    echo "FC Slave    license expires, please update license key!!"
    exit -1
else
    echo "FC Slave    license remains $fc_license_day days"
fi

if [ "$iscsi_license" -gt "1" ]; then
    echo "ISCSI Slave license expires, please update license key!!"
    exit -2
else
    echo "ISCSI Slave license remains $iscsi_license_day days"
fi

exit 0 

