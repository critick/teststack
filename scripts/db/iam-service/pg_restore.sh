HOME_DIR=`echo $HOME`

mkdir -p "$HOME_DIR""/.iam-dump/"
cd "$HOME_DIR""/.iam-dump/"

rm -Rf iam_dump.sql
rm -Rf latest_dump.tar.gz

LATEST_DUMP=`s3cmd ls s3://tinyowl-db-test-dump/qa/iam-service/postgres/ | sort | tail -1 | grep -o '[^ ]*$'`
s3cmd get "$LATEST_DUMP" latest_dump.tar.gz
tar -zxvf latest_dump.tar.gz

POSTGRES_HOST="localhost"
POSTGRES_DBNAME="iam-service"
POSTGRES_USER="geo_rails"

psql --host="$POSTGRES_HOST" --username="$POSTGRES_USER" --dbname="$POSTGRES_DBNAME" -c "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'iam-service' AND pid <> pg_backend_pid();"
dropdb --host="$POSTGRES_HOST" --username="$POSTGRES_USER" "$POSTGRES_DBNAME"
createdb --host="$POSTGRES_HOST" --username="$POSTGRES_USER" "$POSTGRES_DBNAME"
psql --host="$POSTGRES_HOST" --username="$POSTGRES_USER" --dbname="$POSTGRES_DBNAME" < iam_dump.sql

sudo service postgresql restart
cd "$HOME_DIR"
