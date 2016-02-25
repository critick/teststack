#Takes dump of postgres from release server and puts to s3 tinyowl-db-dump-backups/tinyowl_app/
#!/bin/bash

POSTGRES_HOST="172.31.80.138"
POSTGRES_USER="geo_rails"
POSTGRES_PASSWORD="123456"

DATE_TIME=`date +"%F_%H-%M-%S"`
DB_DUMP_FILENAME="tinyowl-pg-dump-""$DATE_TIME"".tar.gz"

HOME_DIR=`echo $HOME`

mkdir -p "$HOME_DIR""/.iam-dump/"
cd "$HOME_DIR""/.iam-dump/"

rm -Rf iam_dump.sql

pg_dump -h "$POSTGRES_HOST" --dbname=iam-service -U "$POSTGRES_USER"> iam_dump.sql

tar -cvzf $DB_DUMP_FILENAME iam_dump.sql

s3cmd put  $DB_DUMP_FILENAME s3://tinyowl-db-test-dump/qa/iam-service/postgres/ --verbose

rm -Rf $DB_DUMP_FILENAME
rm -Rf iam_dump.sql

cd "$HOME_DIR"
