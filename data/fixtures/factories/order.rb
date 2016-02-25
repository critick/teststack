#require 'factory_girl'

FactoryGirl.define do

  ############## Order ###############################
  # FactoryGirl.create(:order)
  # Optional params: user_id, restaurant_id
  ####################################################

  factory :order do
    number_of_items  2
    delivery_time {Time.now.to_i + 30*60}
    platform "ANDROID"
    payment_method "COD"
    
    before(:create) do |order, evaluator|
      order.session_token = evaluator.restaurant_id
      order.order_status = evaluator.order_status || 'ADDED'
    end

    after(:create) do |order|
      cart = FactoryGirl.create(:cart, :order => order,:restaurant_id => order.restaurant_id)
      order_payment = FactoryGirl.create(:order_payment, :order => order, :cart => cart)
    end

    trait :delivered_order do
      order_status 'DELIVERED'
    end

  end

  ############## Cart ###############################

  factory :cart do
    amount 350
    number_of_items 1
    offers_by_tinyowl 0
    total_discount 0
    offers_by_restaurant 0
    order_item
    #before(:create) do |cart, evaluator|
    #cart.order_items = [FactoryGirl.build(:order_item)]
    #end
  end

  ############## OrderItem ###############################

  factory :order_item do
    name "Bites Box"
    quantity 1
    base_price 350
    total_price 350
    veg_type "NEUTRAL"
    item_id "55e0605a70bdba40270008a3"
    item_size_id "55e0605a70bdba40270008a4"
    #cart_id "eaa31838-c4be-4203-801a-004c8e6cbb59"
  end

  ############## OrderPayment ###############################

  factory :order_payment do
    order
    cart
    delivery_charges 40
    packaging_charges 0
    total_amount  390
    offers_by_restaurant 0
    offers_by_tinyowl 0
    total_offers_by_restaurant 0
    total_offers_by_tinyowl 0
    discounted_amount 390
    service_tax 0
    vat 0
    payable_amount 350
    paid_by_online 0
    paid_by_cod 350
    spot_payment_to_restaurant 0
    db_collect_from_user 0
    commission_from_restaurant 10

    trait :card do
      paid_by_cod 0
      paid_by_online 350
    end

    trait :cheap_order do
      payable_amount 350
    end

    trait :offer do
      delivery_charges 40
      packaging_charges 0
      total_amount  390
      offers_by_restaurant 0
      offers_by_tinyowl 10
      total_offers_by_restaurant 0
      total_offers_by_tinyowl 10
    end

    before(:create) do |order_payment, evaluator|
      order_payment.restaurant_id = evaluator.order.restaurant_id
    end

    after(:create) do |order_payment|

    end
  end
end
