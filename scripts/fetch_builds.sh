# $# : no of arguments (this should be min 2 and max 3 )
# $1 : appname (example or restaurant)
# $2 : variant choose one from (internal staging preprod production development release )
# $3 : tag (optional) Eg v3.8.2

APP_LOCAL_DIR=".tmp-app-builds"
HOME_DIR=`echo $HOME`
CURR_DIR=`echo "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"`

# Check for valid arguments to script
if [ $# -lt 2 ]; then
   echo "Usage: $0 <appname> <variant> [tag]"
   exit 1
fi

BUILD_PATTERN="$1_$2_debug_[0-9].*.apk"

if [ $1 == "example" ] ;then
   APP_PATH="android"
else
   echo "app name: $1 is invalid"
   exit 1
fi

mkdir -p "$HOME_DIR""/$APP_LOCAL_DIR/"
cd "$HOME_DIR""/$APP_LOCAL_DIR/"

echo "starting to download the build ....."
S3URL="s3://example-db-test-dump/qa/${APP_PATH}/debug/$2/"
LATEST_BUILD_URL=`s3cmd ls $S3URL | sort | tail -1 | grep -o '[^ ]*$'`
LATEST_BUILD=`echo $LATEST_BUILD_URL|grep -o "$BUILD_PATTERN"`
s3cmd get "$LATEST_BUILD_URL"

BUILD_RESULT=$?
if [ $BUILD_RESULT -eq 0 ]; then
   echo "Downloaded the build $LATEST_BUILD "
else
   echo "Download skipped or failed for the build $LATEST_BUILD"
fi

cd $CURR_DIR

# change the paths for apk and base package as per inputs
gsed -i'' 's/*.apk/~\/'$APP_LOCAL_DIR'\/'$LATEST_BUILD'/g' ../config/example/android/appium.txt
gsed -i'' 's/com.org.example.staging|com.org.exampledevelopment/com.org.example.'$2'/g' ../config/example/android/appium.txt
