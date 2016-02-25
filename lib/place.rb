require 'rest-client'

class OrderFlow
  
  @@OrderHash = {}
  
   def place_order(count)

   oOrder = {
              "order": {
                "failed_promo_codes": [
                ],
                "_id": "95655501-df9f-4f1c-9de8-731701b96efb",
                "total_amount": 476,
                "number_of_items": 4,
                "address_id": 519234,
                "restaurant_id": "55fd4d958c6d73cb8900020b",
                "min_delivery_amount": 100,
                "restaurant_name": "Hello Paratha",
                "restaurant_area": "25 Destination Centre",
                "delivery_duration": 2700,
                "total_discount": 0,
                "payable_amount": 476,
                "delivery_charges": 0,
                "packaging_charges": 0,
                "service_tax": 0,
                "vat": 0,
                "offers_by_restaurant": 0,
                "offers_by_tinyowl": 0,
                "offer_ids": [],
                "promo_codes": [],
                "is_gift_order": false,
                "created_at": 0,
                "show_questions": false,
                "order_status": "DRAFT",
                "delivery_type": "DEFAULT",
                "placed_from_device": false,
                "total_offers_by_tinyowl": 0,
                "total_offers_by_restaurant": 0,
                "rewarded_tinyowl_money": 0,
                "total_rewarded_tinyowl_money": 0,
                "restaurant_logo_url": "",
                "phone_no": [
                  "+918806221867",
                  "+918806221867"
                ],
                "is_question_submitted": false,
                "order_notifications": [],
                "order_status_events": [],
                "is_group_order": false,
                "discounted_amount": 476,
                "paid_by_card": 0,
                "paid_by_cod": 476,
                "paid_by_net_banking": 0,
                "paid_by_coins": 0,
                "paid_by_wallet": 0,
                "paid_by_tinyowl_money": 0,
                "cart": {
                  "amount": 476,
                  "number_of_items": 4,
                  "discount": 0,
                  "offers_by_restaurant": 0,
                  "offers_by_tinyowl": 0,
                  "total_discount": 0,
                  "order_id": "95655501-df9f-4f1c-9de8-731701b96efb",
                  "order_items": [
                    {
                      "id": "c3ff7c67-1be5-469a-8af3-d28a1f5b85d9",
                      "item_size_id": "55fd4f5e457f4ff94b000051",
                      "item_id": "55fd4f5e457f4ff94b000050",
                      "name": "Veggie Paratha Box",
                      "base_price": 119,
                      "total_price": 119,
                      "quantity": 4,
                      "size": "None",
                      "discount": 0,
                      "offers_by_restaurant": 0,
                      "offers_by_tinyowl": 0,
                      "veg_type": "VEG",
                      "cart_id": "83cc956d-27d4-4610-b419-eb62dbfe17cb",
                      "order_item_choices": [
                        {
                          "choice_id": "55fd4f5e457f4ff94b000047",
                          "choice_name": "Choose Your Paratha",
                          "option_id": "55fd4f5e457f4ff94b000049",
                          "choice_option_name": "Aloo Pyaz",
                          "number": 1,
                          "price": 0,
                          "order_item_id": "c3ff7c67-1be5-469a-8af3-d28a1f5b85d9"
                        },
                        {
                          "choice_id": "55fd4f5e457f4ff94b000047",
                          "choice_name": "Choose Your Paratha",
                          "option_id": "55fd4f5e457f4ff94b00004a",
                          "choice_option_name": "Classic Aloo",
                          "number": 1,
                          "price": 0,
                          "order_item_id": "c3ff7c67-1be5-469a-8af3-d28a1f5b85d9"
                        }
                      ]
                    }
                  ]
                }
              },
              "payment": {
                "method": "COD",
                "bring_change": 500,
                "sdk": "TINYOWL_DEFAULT"
              },
             "session_token":"137222zVx9lebur0cfqjIJDzEgE4sZcvSpEzjcmAousRc6DNvf7YhJDwQwNYFEbEcg1bRMj0vZESqFIEqrIBOV7LiCJgEE"
}
  
      for i in 1..count
        
          orderJSON = oOrder.to_json
          orderResponse = RestClient.post "https://api-release.tinyowl.com/restaurant/api/v1/restaurants/55fd4d958c6d73cb8900020b/order", orderJSON, :content_type => :json, :accept => :json
          orderHash = JSON.parse orderResponse
          puts orderHash["order_id"]
      end
  end
   
  def cancel_orders(order_type)
      count = 0
      orderResponse = RestClient.get "https://api-release.tinyowl.com/restaurant/restaurant_product/fetch_orders?type=#{order_type}&session_token=520930icsD7OJmIqS4LAgObCSRJzSkiY8GJMAVKyxwf5VOWzFiFkSLyMZUMbOvYKfkwUaBg2w3jyn8eEhJUcnA49or9AOO"
      orderHash = JSON.parse orderResponse
      orderHash["payload"].each_with_index do |order, i|
        #break if i > 10
        
        oOrder= {
                  "order_id":order['id'],
                  "initiated_key":"USER",
                  "reason_key":"USER_UNAVAILABLE",
                  "is_compensation_by_tinyowl":"false",
                  "session_token":"137222zVx9lebur0cfqjIJDzEgE4sZcvSpEzjcmAousRc6DNvf7YhJDwQwNYFEbEcg1bRMj0vZESqFIEqrIBOV7LiCJgEE"
                }
        
        orderJSON = oOrder.to_json
        puts "#{order['id']}"
        orderResponse = RestClient.put "https://api-release.tinyowl.com/omp/api/#{order['id']}/cancel", orderJSON, :content_type => :json, :accept => :json
        orderHash = JSON.parse orderResponse
        puts "#{order['id']} is cancelled "
        count = count + 1
      end
     puts "#{count} #{order_type} orders are cancelled"
  end
end

#Calling the PlaceOrder

 order = OrderFlow.new
 
 order.place_order(1)
 #order.cancel_orders("NEW")
 #order.cancel_orders("PREPARING")
 #mark delivred
 #mark confirmed_by_ff
 
