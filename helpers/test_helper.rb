require "capybara"

 Capybara.add_selector(:name) do
   xpath { |name| XPath.descendant[XPath.attr(:name).contains(name)] }
 end

 Capybara.add_selector(:id) do
   xpath { |id| XPath.descendant[XPath.attr(:id) == id.to_s] }
 end

 Capybara.add_selector(:row) do
   xpath { |num| ".//tbody/tr[#{num}]" }
 end

 Capybara.add_selector(:flash_type) do
   css { |type| "#flash.#{type}" }
 end
