#!/bin/bash
CLASS=$1
CONTAINER_NAME="gatling"
IMAGE_NAME="irfanah/gatling"


function check_image_exist {
  echo -e "check if docker image exists ... "

  if docker images | grep -w ${IMAGE_NAME}
  then
  echo -e "image already exists. we can run container..."

  else
  build_image
  fi
}

function delete_old_reports {
rm -rf $WORKSPACE/results/
docker exec $CONTAINER_NAME rm -rf /opt/gatling/results/*
}

function build_image {

  echo -e "\nbuilding the image ..."
   docker build -t ${IMAGE_NAME} .
   echo -e "\n finished building the image ..."

}

function check_container_exist {

echo -e "\nchecking if the container exists ..."
    if docker ps -a | grep ${CONTAINER_NAME}
    then
        echo -e "\n container already exists ..."
    else
        echo -e " \n Running the container ..."
        docker start ${CONTAINER_NAME}
    fi
}

function stop_container {
docker stop ${CONTAINER_NAME} /opt/gatling/bin/gatling.sh
}

function run_gatling_test {
docker exec ${CONTAINER_NAME} raake load
}

function copy_gatling_reports_to_workspace {
docker cp ${CONTAINER_NAME}:/opt/gatling/results $WORKSPACE/
}



check_image_exist
check_container_exist
delete_old_reports
run_gatling_test
copy_gatling_reports_to_workspace
stop_container
