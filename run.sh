#!/bin/bash
if [ -z "$1" ]
  then
    VERSION="latest"
else
    VERSION=$1
fi
docker run -it finalspy/openxlsx333:$VERSION
