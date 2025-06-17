#!/bin/bash

# build the gridappsd/proven container
# pull the repos froms stash
# will switch to full dockerfile build when code is on github

if [ ! -d proven-message  -o ! -d proven-cluster -o ! -d proven-docker ]; then
  echo "Please pull the proven repos from stash before continuing"
  exit 1
fi

image="gridappsd/proven"
tag="dev"

cwd=`pwd`

cd $cwd
cd proven-message
#git checkout tags/gridappsd_v1.0
git pull -v

cd $cwd
cd proven-cluster/proven-member
#git checkout tags/gridappsd_v1.0
git pull -v

cd $cwd
cd proven-docker
git pull -v

cd $cwd

TIMESTAMP=`date +'%y%m%d%H'`
echo "docker build --build-arg TIMESTAMP=\"$TIMESTAMP\" -t ${image}:$TIMESTAMP -f proven-docker/Dockerfile ."
docker build --build-arg TIMESTAMP="$TIMESTAMP" -t ${image}:$TIMESTAMP -f proven-docker/Dockerfile .
status=$?

echo $status

if [ "$status" -gt 0 ]; then
  echo "build failed"
  exit 1
else
  echo "Run these commands to tag and push to dockerhub"
  echo "docker tag ${image}:$TIMESTAMP ${image}:$tag"
  echo "docker push ${image}:$TIMESTAMP"
  echo "docker push ${image}:$tag"
fi
