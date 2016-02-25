Then(/^"([^"]*)" orders are fetched$/) do |section|
      @posweb.home.verify_orders_section(section)
end
