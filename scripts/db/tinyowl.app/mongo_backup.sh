#Takes mongo dump from release server and uploads to s3 tinyowl-db-dump-backups/tinyowl_app/
#!/bin/bash
export LC_ALL=C
MONGO_HOST="172.31.80.138"
MONGO_USERNAME="Alice"
MONGO_PASSWORD="Moon1234"

DATE_TIME=`date +"%F_%H-%M-%S"`
DB_DUMP_FILENAME="tinyowl-mongo-dump-""$DATE_TIME"".tar.gz"

HOME_DIR=`echo $HOME`

mkdir -p "$HOME_DIR""/.tinyowl-mongo-dump/"
cd "$HOME_DIR""/.tinyowl-mongo-dump/"

mongodump -h "$MONGO_HOST" -d "restaurant-service-production" -u "$MONGO_USERNAME" -p "$MONGO_PASSWORD"

DB=(restaurant_service_feedback_order_feedbacks restaurant_service_android_bugs restaurant_service_offer_blocked_users restaurant_service_data_entry_menu_scheduled_updates restaurant_service_feedback_restaurant_performances restaurant_service_notifications order_delivery_details email_queues restaurant_service_operating_time_bins restaurant_service_restaurant_settlement_order_settlements restaurant_service_data_entry_restaurant_status_scheduled_updates restaurant_service_payment_meta_data restaurant_service_offer_promo_codes restaurant_service_data_entry_employees restaurant_service_data_entry_restaurant_assignments restaurant_service_restaurant_cap_hit_logs restaurant_service_data_entry_revisions restaurant_service_restaurant_product_pos_automation_call_logs restaurant_service_landing_page_signups restaurant_service_db_action_logs restaurant_service_promotion_mumbai_indians_scorecards restaurant_service_promotion_mumbai_indians_score_logs restaurant_service_tastykhana_restaurants restaurant_service_zomato_restaurants restaurant_service_promotion_mumbai_indians_score restaurant_service_order_drafts  restaurant_service_orders restaurant_service_order_payments restaurant_service_order_item_frequencies restaurant_service_justdial_restaurants restaurant_service_db_action_logs restaurant_service_agent_action_logs)

services=${#DB[@]}

for ((i=0; i < $services; i++)); do
  rm -rf ${DB[i]}.bson
  rm -rf ${DB[i]}.metadata.json
done

tar -cvzf $DB_DUMP_FILENAME dump/
s3cmd put  $DB_DUMP_FILENAME s3://tinyowl-db-test-dump/qa/tinyowl.app/mongo/ --verbose
rm -Rf $DB_DUMP_FILENAME
rm -Rf dump/

cd "$HOME_DIR"
