#Takes dump of postgres from release server and puts to s3 tinyowl-db-dump-backups/tinyowl_app/
#!/bin/bash
POSTGRES_HOST="172.31.80.138"
POSTGRES_USER="geo_rails"

DATE_TIME=`date +"%F_%H-%M-%S"`
DB_DUMP_FILENAME="tinyowl-pg-dump-""$DATE_TIME"".tar.gz"

cd "$HOME_DIR"

mkdir -p "$HOME_DIR""/.location-dump/"
cd "$HOME_DIR""/.location-dump/"

rm -Rf location_dump.sql
pg_dump -h "$POSTGRES_HOST" --dbname=location-service -U "$POSTGRES_USER" > location_dump.sql
tar -cvzf $DB_DUMP_FILENAME location_dump.sql
s3cmd put  $DB_DUMP_FILENAME s3://tinyowl-db-test-dump/qa/location-service/postgres/ --verbose
rm -Rf $DB_DUMP_FILENAME
rm -Rf location_dump.sql

cd "$HOME_DIR"
