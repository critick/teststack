source ~/.bashrc
export ANDROID_HOME=/Users/qa/Library/Android/sdk/

#TAG=$(git describe --tags $(git rev-list --tags --max-count=2)) #2 since latest tag build failed
#git checkout  tags/$TAG

DATE_TIME=`date +"%F_%H-%M-%S"`

git submodule init
git submodule update

variant=(Staging internal preprod production)
dir=(staging internal preprod production)

builds=${#variant[@]}

for ((i=0; i < $builds; i++)); do

  echo "building apk started for ${variant[i]} ....."
  BUILD_APK="tinyowl_${variant[i]}_debug_""$DATE_TIME"".apk"
  gradle task assemble${variant[i]}Debug
  BUILD_RESULT=$?
  if [ $BUILD_RESULT -eq 0 ]; then
     cp TinyOwl/build/outputs/apk/TinyOwl-${dir[i]}-debug.apk $BUILD_APK
     s3cmd put  $BUILD_APK s3://tinyowl-db-test-dump/qa/android/debug/${dir[i]}/ --verbose
     echo "building apk completed for ${variant[i]} ....."
  else
     echo "building apk failed for ${variant[i]} ....."
  fi

done
