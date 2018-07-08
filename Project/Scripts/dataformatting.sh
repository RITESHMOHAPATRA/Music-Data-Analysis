#!/bin/bash

batchid=`cat /home/acadgild/Project/logs/current-batch.txt`
LOGFILE=/home/acadgild/Project/logs/log_batch_$batchid

echo "Placing data files from local to HDFS..." >> $LOGFILE

hadoop fs -rm -r /user/acadgild/Project/batch${batchid}/web/
hadoop fs -rm -r /user/acadgild/Project/batch${batchid}/formattedweb/
hadoop fs -rm -r /user/acadgild/Project/batch${batchid}/mob/

hadoop fs -mkdir -p /user/acadgild/Project/batch${batchid}/web/
hadoop fs -mkdir -p /user/acadgild/Project/batch${batchid}/mob/

hadoop fs -put /home/acadgild/Project/Data/Web/* /user/acadgild/Project/batch${batchid}/web/
hadoop fs -put /home/acadgild/Project/Data/Mob/* /user/acadgild/Project/batch${batchid}/mob/

echo "Running pig script for data formatting..." >> $LOGFILE

pig -param batchid=$batchid /home/acadgild/Project/Scripts/dataformatting.pig

echo "Running hive script for formatted data load..." >> $LOGFILE

hive -hiveconf batchid=$batchid -f /home/acadgild/Project/Scripts/formatted_hive_load.hql


