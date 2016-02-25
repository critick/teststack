#require 'factory_girl'

FactoryGirl.define do

  ############## Dish ###############################
  # FactoryGirl.create(:dish)
  # required params: name, restaurant_id
  ###################################################

  factory :dish do
    sequence(:name)         {|n| "test factory dish #{n}" }
    sequence(:description)  {|n| "This is an awesome Dish. Try it once!"}
    status                  "ACTIVE"
    image_id                1
    contain_tags            [{:id => 1, :name => "SIGNATURE ITEM 1", :price => 100, :quantity => 1 }]
    veg_type                "VEG"
    price                   100.00
    available_days          ["1", "2", "3", "4", "5", "6", "7", "8"]
    serves                  1
    timings                 ["abc123", "abc234", "abc456"]
    
    before(:create) do |dish, evaluator|
      dish.restaurant_id = evaluator.restaurant_id || FactoryGirl.create(:restaurant).id
    end
  end
end
