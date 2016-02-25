require 'yaml'

class TestData
    def self.get_product_fixtures(file_name)
      fixture_file = File.join(File.dirname(__FILE__),file_name)
      YAML.load_file(fixture_file)
    end
end


TestData.get_product_fixtures.values.each do |fixture|
   puts fixture["id"]
end
#puts TestData.get_product_fixtures("data/playstore.yml")["fixture_1"]["name"]
