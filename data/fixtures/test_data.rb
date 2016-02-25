require 'yaml'
require 'net/http'
require 'json'
require 'faker'

class TestData

  def self.set_environment(environment)
     @environment = environment
  end

  def self.get_environment
     @environment || :test
  end

  def self.get_base_url
    {
      :production => "",
      :staging    => "http://api-release.tinyowl.com",
      :test       => "http://api-f-pos.tinyowl.com",
    }[self.get_environment]
  end

  def self.get_fixtures(suite)
      fixture_file = File.join(File.dirname(__FILE__),'fixtures.yml')
      fixtures_data = YAML.load_file(fixture_file)
      if !suite
         return fixtures_data   #return entire fixture
      else
        return fixtures_data[suite]
      end
  end

  def self.get_data_from_api
    uri = URI.parse("")
    json_string = make_get_request(uri)
    JSON.parse(json_string)
  end

  def self.get_full_name
    Faker::Name.name
  end

  def self.get_email
    Faker::Internet.email
  end

  def self.get_user_values(overwrites = {})
    {
      :name    => self.get_full_name,
      :email   => self.get_email
    }.merge(overwrites)
  end

end
