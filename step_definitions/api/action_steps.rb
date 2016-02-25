Given(/^A Restaurant with POS enabled$/) do
  @api.restaurant_model.set_restaurant_for_active_pos_and_DBR
end

Given(/^User Places the order$/) do
  @api.place_order.place_resto_order "regular"
  @order_id=@api.place_order.get_order_id
end

When(/^Restaurant User Accept the Order$/) do
  @api.restaurant_app_action.accept_order @order_id
end

Then(/^CS User can verify the order logs for "([^"]*)"$/) do |status|
  @api.order_details.request_order_activity @order_id

  if status=="Accepted Order"

    for payload_array in @api.order_details.get_order_details["payload"]
        sRestoPlaced = payload_array["action"]

        if sRestoPlaced == "RESTAURANT PLACED"
            reason = payload_array["action_message"]
            puts sRestoPlaced
            puts reason
          break
        end
    end

    for payload_array in @api.order_details.get_order_details["payload"]
        status = payload_array["action"]
        if status == "CONFIRMED"
          break
        end
    end

    expect(sRestoPlaced).to eq("RESTAURANT PLACED")
    expect(status).to eq("CONFIRMED")
    expect(reason).to eq("Restaurant entered the time 1min")


  elsif status=="Declined Order"
  # sRestoAction = @api.order_details.get_order_details["payload"][1]["action"]

  for payload_array in @api.order_details.get_order_details["payload"]
      @elements = payload_array["action"]
      if @elements == "RESTAURANT DECLINED"
        break
      end
  end

  expect(@elements).to eq("RESTAURANT DECLINED")

  @api.order_details.request_order_allocation_details @order_id

  for payload_array in @api.order_details.get_order_details["payload"]
      @elements = payload_array["action"]
      if @elements == "ADD_POOL"
        break
      end
  end
  expect(@elements).to eq("ADD_POOL")

  end
end

When(/^Restaurant User Decline the Order$/) do
  @api.restaurant_app_action.decline_order @order_id
end
