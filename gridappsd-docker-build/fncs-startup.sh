#!/bin/bash

export PATH=$PATH:/gridappsd/bin

CON=$1
SIM=$2

# change to the logging directory to capture logfile in the right directory
# create the simulation directory if it doesn't exist
cd /tmp/gridappsd/log

if [ ! -d $SIM ]; then
  mkdir $SIM
fi

cd $SIM

fncs_broker $CON
