#!/bin/bash
docker run \
    --rm \
    -it \
    -e LOCAL_USER_ID=`id -u $USER` \
    -p 4001:4001 \
    -v ${PWD}/../share/octopress:/octopress \
    -v ${PWD}/post-install.sh:/home/user/post-install.sh \
    -v ${HOME}/.ssh:/home/user/.ssh \
    draptik/octopress:0.1 \
    /bin/bash

