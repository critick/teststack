#!/bin/bash -l
source ~/.bashrc
export ANDROID_HOME=/Users/qa/Library/Android/sdk/
DATE_TIME=`date +"%F_%H-%M-%S"`

git submodule init
git submodule update

variant=(releaseServer development preprod production)
dir=(release development preprod production)

builds=${#variant[@]}

for ((i=0; i < $builds; i++)); do

  echo "building apk started for ${variant[i]} ....."
  BUILD_APK="restaurant-${variant[i]}_debug_""$DATE_TIME"".apk"
  gradle task assemble${variant[i]}Debug
  BUILD_RESULT=$?
  if [ $BUILD_RESULT -eq 0 ]; then
     cp app/build/outputs/apk/app-${variant[i]}-debug.apk $BUILD_APK
     s3cmd put $BUILD_APK s3://tinyowl-db-test-dump/qa/restaurant_android/debug/${dir[i]}/ --verbose
     echo "building apk completed for ${variant[i]} ....."
 else
    echo "building apk failed for ${variant[i]} ....."
 fi

done
