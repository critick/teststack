class Dish
  
  @@dishesHash = {}
  
  def notify
    
      if localityId == 0 #if locality not found
        messageBody = 'Locality not found,<your_pincode> to search '
      else
        #fetch the top 5 dishes for that locality
         oDishes = {
        "locality_id": localityId,
        "device_id":"sasdfafafaf",
        "app_version":"3.3.6",
        "platform":"ANDROID",
        "dishes":{
             "token": {
               "valid_until": 1411204180,
                 "start_index":1,
               "network": "3G",
               "more": true
             },
         "image_width": 800,
             "dpi": 2
         },
        "restaurants": {
               "width": 400,
             "token":{
               "valid_until": 1411204180,
               "start_index": 1,
               "network": "3G",
               "more": true
             },
           "sort_by": "delivery_time",
             "filter_by": {
                 "cuisines": [],
                 "cost_for_two_ranges": []
             },
             "dpi": 2
        }
     }
     
      oDishesJSON = oDishes.to_json
      dishesResponse = JSON.parse(RestClient.post("http://app-tech.tinyowl.com/restaurant/api/v1/feed", oDishesJSON, :content_type => :json, :accept => :json))
      messageBody = 'Dishes available at this time: '
      if dishesResponse["status_codes"]["dishes"] == "SUCCESS"
        dishesResponse["dishes"]["dishes"].each_with_index do |dish, i|
          break if i > 4
          @@dishesHash[i+1] = dish['name'] + '_' + dish['price'].to_s
          messageBody = messageBody + "#{i+1}) #{dish['name']} - Rs." + dish['price'].to_s + ", "
      end
        messageBody = messageBody.from(0).to(messageBody.rindex(',') - 1) + ', SMS DISH <your_dish_number> <quantity> <address> to order';
      else
        messageBody = ':( No dishes available at this time'
      end
    end
    
    elsif orderTextInitial == "DISH" && @@dishesHash != {} # Case if DISH is included in the message
      dishArray = orderText.split(' ');
      dishId = dishArray[1].nil? ? 0 : dishArray[1].to_i
      quantity = dishArray[2].nil? ? 0 : dishArray[2]
      address = dishArray[3].nil? ? '' : dishArray[3]
      if dishId < 6 && quantity != 0 && address != ''
      #place order if a particular dish is sent by the customer, hard-coded as of now
      total_price = @@dishesHash[dishId].split('_')[1].to_f * quantity.to_f
      oOrder = {
          "session_token":"137222zVx9lebur0cfqjIJDzEgE4sZcvSpEzjcmAousRc6DNvf7YhJDwQwNYFEbEcg1bRMj0vZESqFIEqrIBOV7LiCJgEE",
          "order": {
            "failed_promo_codes": [
            ],
            "total_amount": total_price.to_i,
            "number_of_items": quantity.to_i,
            "address_id": 197966,
            "restaurant_id": "52f76bd0f92ea1cd080000ca",
            "min_delivery_amount": 0,
            "restaurant_name": "Juicy Stuff",
            "restaurant_area": "Powai",
            "delivery_duration": 60,
            "total_discount": 0,
            "payable_amount": total_price.to_i,
            "delivery_charges": 0,
            "packaging_charges": 0,
            "service_tax": 0,
            "vat": 0,
            "offers_by_restaurant": 0,
            "offers_by_tinyowl": 0,
            "offer_ids": [
              
            ],
            "promo_codes": [
              
            ],
            "is_gift_order": false,
            "show_questions": false,
            "order_status": "DRAFT",
            "order_delivery_feedback": "DEFAULT",
            "delivery_type": "EXPRESS",
            "placed_from_device": false,
            "total_offers_by_tinyowl": 0,
            "total_offers_by_restaurant": 0,
            "rewarded_tinyowl_money": 0,
            "total_rewarded_tinyowl_money": 0,
            "order_notifications": [
              
            ],
            "is_group_order": false,
            "discounted_amount": 0,
            "paid_by_card": 0,
            "paid_by_cod": total_price.to_i,
            "paid_by_net_banking": 0,
            "paid_by_coins": 0,
            "paid_by_wallet": 0,
            "paid_by_tinyowl_money": 0,
            "cart": {
              "amount": total_price.to_i,
              "number_of_items": quantity.to_i,
              "discount": 0,
              "offers_by_restaurant": 0,
              "offers_by_tinyowl": 0,
              "total_discount": 0,
              "order_id": "85ea730e-ed68-4181-9d7e-5640fb6bdd55",
              "order_items": [
                {
                  "id": "973c5298-76c9-42cb-bc39-1af6ae0c392f",
                  "item_size_id": "5516734004497f5f82000025",
                  "item_id": "5516734004497f5f82000024",
                  "name": @@dishesHash[dishId].split('_')[0].to_s,
                  "base_price": @@dishesHash[dishId].split('_')[1].to_i,
                  "total_price": @@dishesHash[dishId].split('_')[1].to_i,
                  "quantity": quantity.to_i,
                  "discount": 0,
                  "offers_by_restaurant": 0,
                  "offers_by_tinyowl": 0,
                  "cart_id": "07c348ec-f820-4ed7-a67a-5186bfd33c9f",
                  "order_item_choices": [
                    
                  ]
                }
              ]
            }
          },
          "payment": {
            "method": "COD",
            "sdk": "TINYOWL_DEFAULT"
          }
        }
        orderJSON = oOrder.to_json
        orderResponse = RestClient.post "http://app-tech.tinyowl.com/restaurant/api/v1/restaurants/52f76bd0f92ea1cd080000ca/order", orderJSON, :content_type => :json, :accept => :json
        orderHash = JSON.parse orderResponse
        messageBody = 'You ordered ' + quantity + ' ' + @@dishesHash[dishId].split('_')[0] + ', Your order placed at time:' + Time.at(orderHash["created_at"]).strftime("%H:%M") + ', Your order id is: ' + orderHash["order_id"] + ', Expected to be delivered at time: ' + Time.at(orderHash["delivery_time"]).strftime("%H:%M") + ', Total price: ' + total_price.to_s + ', Thanks for ordering with Tinyowl :)'
      
  end
