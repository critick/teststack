export LC_ALL=C
POSTGRES_HOST="localhost"
POSTGRES_USER="geo_rails"
DUMP_DIR=".tmp-db-dump"

HOME_DIR=`echo $HOME`
SERACH_PATTERN="tinyowl-pg-dump-[0-9].*.tar.gz"

## creating temp folder and cding into it
mkdir -p "$HOME_DIR""/$DUMP_DIR/"
cd "$HOME_DIR""/$DUMP_DIR/"
# rm old files
rm -Rf dump
rm -Rf tinyowl_app_dump.sql

DB=(tinyowl_production iam-service location-service)
DUMP=(tinyowl_app_dump.sql iam_dump.sql location_dump.sql)
service=(tinyowl.app iam-service location-service)

services=${#DB[@]}

for ((i=0; i < $services; i++)); do

    rm -Rf ${DUMP[i]}

    S3URL="s3://tinyowl-db-test-dump/qa/${service[i]}/postgres/"
    LATEST_DUMP_URL=`s3cmd ls $S3URL | sort | tail -1 | grep -o '[^ ]*$'`
    LATEST_DUMP=`echo $LATEST_DUMP_URL|grep -o "$SERACH_PATTERN"`
    s3cmd get "$LATEST_DUMP_URL"
    echo "Downloaded the dump $LATEST_DUMP "
    tar -zxvf $LATEST_DUMP

    echo "Restoring postgres dump now for ${DB[i]} ....."
    POSTGRES_DBNAME=${DB[i]}
    psql --host="$POSTGRES_HOST" --username="$POSTGRES_USER" --dbname="$POSTGRES_DBNAME" -c "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = '${DB[i]}' AND pid <> pg_backend_pid();"
    dropdb --host="$POSTGRES_HOST" --username="$POSTGRES_USER" "$POSTGRES_DBNAME"
    createdb --host="$POSTGRES_HOST" --username="$POSTGRES_USER" "$POSTGRES_DBNAME"
    psql --host="$POSTGRES_HOST" --username="$POSTGRES_USER" --dbname="$POSTGRES_DBNAME" < ${DUMP[i]}
    echo "Restoring postgres dump completed for ${DB[i]} ....."
done

cd $HOME_DIR


# Change the below variables as per your need

MONGO_DBNAME="restaurant-service-production"
DUMP_DIR=".tmp-dump-mongo"
S3URL="s3://tinyowl-db-test-dump/qa/tinyowl.app/mongo/"
MONGO_HOST="localhost"


# Do not change the below variables
SERACH_PATTERN="tinyowl-mongo-dump-[0-9].*.tar.gz"
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
