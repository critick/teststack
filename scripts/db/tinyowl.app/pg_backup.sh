#Takes dump of postgres from release server and puts to s3 tinyowl-db-dump-backups/tinyowl_app/
#!/bin/bash
POSTGRES_HOST="172.31.80.138"
POSTGRES_USER="geo_rails"

DATE_TIME=`date +"%F_%H-%M-%S"`
DB_DUMP_FILENAME="tinyowl-pg-dump-""$DATE_TIME"".tar.gz"

HOME_DIR=`echo $HOME`

mkdir -p "$HOME_DIR""/.tinyowl-pg-dump/"
cd "$HOME_DIR""/.tinyowl-pg-dump/"

pg_dump -h "$POSTGRES_HOST" --dbname=tinyowl_production -U "$POSTGRES_USER" > tinyowl_app_dump.sql

tar -cvzf $DB_DUMP_FILENAME tinyowl_app_dump.sql

s3cmd put  $DB_DUMP_FILENAME s3://tinyowl-db-test-dump/qa/tinyowl.app/postgres/ --verbose

rm -Rf $DB_DUMP_FILENAME
rm -Rf tinyowl_app_dump.sql

cd "$HOME_DIR"
