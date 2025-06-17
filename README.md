## Objective & Progress:

The objective of this work was to fix the (memory leak issue in GridAPPS-D)[!https://github.com/GRIDAPPSD/gridappsd-forum/discussions/151]. So far, I was able to build a local version of the gridapps-d container. However, the localhost:8080 is stuck at the initialization.

## Notes:

- If you're attempting to solve this issue, you will need to first start with ensuring the local version of the gridappsd container is working as expected. 
- All you need is the three repositories in this folder.

## Changes:

- The Dockerfiles (gridappsd_base and gridappsd) are outdated. They are updated in this repository.
- Within the Dockerfile.gridappsd_base, I use my GridLAB-D version, which is adjusted to minimize the memory leak (not complete, but it works).
- The run.sh file within the gridappsd-docker folder is changed to use the default tag for all the other containers except the gridappsd container.
    - The gridappsd container uses the ```release:psupdxpwrlab``` tag.

## Instructions:

To build a local version of the gridappsd container:

- Within the gridappsd-docker-build folder, run the following:
    - Feel free to change the tags

```docker build -f Dockerfile.gridappsd_base -t gridappsd/gridappsd_base:release_psupdxpwrlab .```

```docker build -f Dockerfile.gridappsd -t gridappsd/gridappsd:release_psupdxpwrlab .```

- These two commands will generate a gridappsd container with the ```release:psupdxpwrlab``` tag.
