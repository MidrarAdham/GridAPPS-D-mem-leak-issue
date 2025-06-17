#!/bin/bash
export PATH=/gridappsd/services/fncsgossbridge/service:$PATH

cd /gridappsd

java -jar lib/run.bnd.jar
# &> /tmp/gridappsd/gridappsd.log
