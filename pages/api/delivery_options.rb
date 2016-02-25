require 'rest-client'
module Pages
  module API
    class DeliveryOptions < BaseAPI

  def request_delivery_options(is_3pl, *delivery_type)
    @delivery_options = File.read( $base_dir + '/data/api/delivery_options.json')
    body = JSON.parse(@delivery_options)
    response = make_post_request "/api/v1/orders/delivery_options",body

    @response_data = JSON.parse(response.body)
    @status_code = response.code

    expect(@status_code).to eq(200)
    expect(@response_data).not_to be_empty

    if is_3pl

      if delivery_type == "extended delivery"
        expect(@response_data["payload"]["delivery_options"][0]["text"]).to eq("Express Delivery")
      else
        expect(@response_data["payload"]["delivery_options"][0]["text"]).to eq("Regular Delivery")
        expect(@response_data["payload"]["delivery_options"][1]["text"]).to eq("Express Delivery")
      end
    else
      expect(@response_data["payload"]["delivery_options"][0]["text"]).to eq("Regular Delivery")
    end
  end

end
end
end
