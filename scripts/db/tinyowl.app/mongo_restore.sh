# Change the below variables as per your need
export LC_ALL=C
MONGO_DBNAME="restaurant-service-production"
DUMP_DIR=".tmp-dump-mongo"
S3URL="s3://tinyowl-db-test-dump/qa/tinyowl.app/mongo/"
MONGO_HOST="localhost"

# Do not change the below variables
SERACH_PATTERN="mongo_db-dump-[0-9].*.tar.gz"
HOME_DIR=`echo $HOME`

#rm -rf "$HOME_DIR""/$DUMP_DIR"
echo "Creating the temporary directory "
rm -rf "$HOME_DIR""/$DUMP_DIR/"
mkdir -p "$HOME_DIR""/$DUMP_DIR/"
echo "Cding to temporary directory "
cd "$HOME_DIR""/$DUMP_DIR/"

# getting latest dump from s3
echo "Downloading the latest dump from s3"
LATEST_DUMP_URL=`s3cmd ls $S3URL | sort | tail -1 | grep -o '[^ ]*$'`
LATEST_DUMP=`echo $LATEST_DUMP_URL|grep -o "$SERACH_PATTERN"`
s3cmd get "$LATEST_DUMP_URL"
echo "Downloaded the dump $LATEST_DUMP "

# Extracting dump
echo "Extracting the dump "
tar -zxvf $LATEST_DUMP
echo "Extracted the dump "



# Droping and restoring the mongo database

echo "Dropping the database $MONGO_DBNAME "
mongo --host $MONGO_HOST "$MONGO_DBNAME" --eval "db.dropDatabase()"
echo "Dropped the database $MONGO_DBNAME"

# Restoring mongo dump
echo "Restoring mongodb dump"
mongorestore --host $MONGO_HOST --db $MONGO_DBNAME dump/restaurant-service-production/
