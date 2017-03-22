#!/bin/bash -ex

FILE_ORIGI=/etc/jenkins_jobs/config/dsvm-cinder-driver-iscsi.yaml
FILE_SELF_FIBRE=/etc/jenkins_jobs/config/dsvm-cinder-driver-fc.yaml
FILE_ISCSI=/etc/jenkins_jobs/config/infortrend-cinder-volume-iscsi.yaml
FILE_FIBRE=/etc/jenkins_jobs/config/infortrend-cinder-volume-fc.yaml

cp $FILE_ORIGI $FILE_SELF_FIBRE
sed -i 's/dsvm-tempest-ift-driver-volume-test-iscsi/dsvm-tempest-ift-driver-volume-test-fc/g' $FILE_SELF_FIBRE
sed -i 's/infortrend_iscsi_cli.InfortrendCLIISCSIDriver/infortrend_fc_cli.InfortrendCLIFCDriver/g' $FILE_SELF_FIBRE
sed -i 's/post-build-iscsi/post-build-fc/g' $FILE_SELF_FIBRE
sed -i 's/export IFT_RAID_CHL_MAP=4,5/export IFT_RAID_CHL_MAP=0,1/g' $FILE_SELF_FIBRE
sed -i 's/iSCSI/FC/g' $FILE_SELF_FIBRE

cp $FILE_ORIGI $FILE_ISCSI
sed -i 's/dsvm-tempest-ift-driver-volume-test-iscsi/infortrend-cinder-volume-iscsi/g' $FILE_ISCSI
sed -i 's/devstack-logs/review-devstack-logs/g' $FILE_ISCSI
sed -i 's/console-log/review-console-log/g' $FILE_ISCSI
sed -i 's/link-logs-dsvm/link-logs/g' $FILE_ISCSI

cp $FILE_ORIGI $FILE_FIBRE
sed -i 's/dsvm-tempest-ift-driver-volume-test-iscsi/infortrend-cinder-volume-fc/g' $FILE_FIBRE
sed -i 's/devstack-logs/review-devstack-logs/g' $FILE_FIBRE
sed -i 's/console-log/review-console-log/g' $FILE_FIBRE
sed -i 's/infortrend_iscsi_cli.InfortrendCLIISCSIDriver/infortrend_fc_cli.InfortrendCLIFCDriver/g' $FILE_FIBRE
sed -i 's/post-build-iscsi/post-build-fc/g' $FILE_FIBRE
sed -i 's/export IFT_RAID_CHL_MAP=4,5/export IFT_RAID_CHL_MAP=0,1/g' $FILE_FIBRE
sed -i 's/iSCSI/FC/g' $FILE_FIBRE
sed -i 's/link-logs-dsvm/link-logs/g' $FILE_FIBRE
