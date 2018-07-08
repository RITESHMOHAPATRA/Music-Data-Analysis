#!/bin/bash

batchid=`cat /home/acadgild/Project/logs/current-batch.txt`
LOGFILE=/home/acadgild/Project/logs/log_batch_$batchid

echo "Creating hive tables on top of hbase tables for data enrichment and filtering..." >> $LOGFILE

hive -f /home/acadgild/Project/Scripts/create_hive_hbase_lookup.hql

