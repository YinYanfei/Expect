#!/bin/sh -
# 2012-10-18  Yanfei
# Entrance of this shell script
#

IFS='
        '

PATH=/usr/local/bin:/usr/bin:/bin
export PATH

expectfile=$1
configfile=$2
commandfile=$3

for line in `cat $configfile`
do
    ip=`echo $line | awk -F"|" '{print $1}'`
    port=`echo $line | awk -F"|" '{print $2}'`
    user=`echo $line | awk -F"|" '{print $3}'`
    pw=`echo $line | awk -F"|" '{print $4}'`

    # Command excute
   #./expect/cassandra.exp $ip $port $user $pw $commandfile
   $expectfile $ip $port $user $pw $commandfile
done
