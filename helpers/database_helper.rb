require 'pg'

class DataBaseHelper

  def self.connect
    @conn = PG.connect(
        :host => '172.31.80.138',
        :dbname => 'iam-service',
        :user => 'geo_rails')
  end

  def self.disconnect
    @conn.close
  end

  def self.get_query(query ,attribute)
      begin
        connect
        @conn.exec(query) do |result|
              return result [0][attribute].to_s
        end
      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
      ensure
        disconnect
      end
  end
end
