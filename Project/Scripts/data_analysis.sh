#!/bin/bash

#Get the batch id for logging purpose
batchid=`cat /home/acadgild/Project/logs/current-batch.txt`
LOGFILE=/home/acadgild/Project/logs/log_batch_$batchid

echo "Running spark script for data analysis..." >> $LOGFILE

#Add Hbase Classpath
hbase_path=`hbase classpath`

#Remove, if any directory already exists for output
hadoop fs -rm -r /acadgild/Project/batch$batchid

#invoke the spark shell script
spark-shell -i /home/acadgild/Project/Scripts/SparkAnalysis.scala --conf spark.driver.args=$batchid --jars /usr/hdp/2.6.4.0-91/hbase/lib/hive-hbase-handler-1.2.1000.2.6.4.0-91.jar,$hbase_path

echo "Incrementing batchid for the next run..." >> $LOGFILE

#Finally, increment the batch id, once process is over
batchid=`expr $batchid + 1`
echo -n $batchid > /home/acadgild/Project/logs/current-batch.txt
