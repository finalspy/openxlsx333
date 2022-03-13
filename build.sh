#!/bin/bash
if [ -z "$1" ]
  then
    echo "Please provide a version !" 
fi
docker build -t finalspy/openxlsx333:$1 .
