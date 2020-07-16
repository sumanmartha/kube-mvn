#!/bin/bash

if (($# <5))
  then
    echo "Usage : $0 <DOCKER_PROJECT_NAME> <APP_NAME> <IMAGE_TAG> <directory containing k8s files> <timestamp>"
    exit 1
fi

PROJECT_NAME=$1
APP_NAME=$2
IMAGE=$3
WORK_DIR=$4
TIMESTAMP=$5

main(){
find $WORK_DIR -name *.yml -type f -exec sed -i.bak1 's#__PROJECT_NAME__#'$PROJECT_NAME'#' {} \;
find $WORK_DIR -name *.yml -type f -exec sed -i.bak2 's#__APP_NAME__#'$APP_NAME'#' {} \;
find $WORK_DIR -name *.yml -type f -exec sed -i.bak3  's#__IMAGE__#'$IMAGE'#' {} \;
find $WORK_DIR -name *.yml -type f -exec sed -i.bak3  's#__TIMESTAMP__#'$TIMESTAMP'#' {} \;
}
main