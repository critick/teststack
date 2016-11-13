#!/bin/sh

TASK=$1
WORKSPACE=$(pwd)
CONTAINER_NAME="teststack"
IMAGE_NAME="irfanah/testsxtack:2.0"


function check_image {
  docker images
  if docker images | grep -w ${CONTAINER_NAME}
  then
  echo -e "\n Image already exists"
  else
  echo -e "\n Image not found"
  build_image
  fi
}

function build_image {
   docker build -t ${IMAGE_NAME} .
}

function check_container {
   echo docker ps -a
    if docker ps -a | grep ${CONTAINER_NAME}
    then
        echo -e "\n Container already exists"
        docker start ${CONTAINER_NAME}
    else
        echo -e "\n Running the container now"
        spin_container
    fi
}

function spin_container {
  docker run -it -d -v $WORKSPACE/:/opt/testing --name ${CONTAINER_NAME} ${IMAGE_NAME}
  echo -e "Listing directoy structure of the cucumber project inside container"
  docker exec ${CONTAINER_NAME} ls /opt/testing/
}

function test {
  docker exec ${CONTAINER_NAME} bundle install
  docker exec ${CONTAINER_NAME} bundle exec rake ${TASK}
  exit $?
}

function report {
 echo "\n Mobing test reports to disk"
 docker cp ${CONTAINER_NAME}:/opt/testing/reports/ $WORKSPACE/reports/
}

function stop_container {
  docker stop ${CONTAINER_NAME}
}

function stop_running_container {
  docker stop ${CONTAINER_NAME}
  docker rm ${CONTAINER_NAME}
}

function cleanup {
  docker exec ${CONTAINER_NAME}  rm -rf /opt/testing/reports
}

check_image
check_container
cleanup
test
report
stop_container
