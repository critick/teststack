require 'csv'
require 'capybara/poltergeist'


#data = {}
#symbols = [:imei, :formid]

puts 'Loading from CSV'
CSV.open(filename, 'r') do |row|
  row = row.to_h
  symbols.each do |sym|
    data[sym] = row.delete(sym.to_s)
  end
  row.delete("attributes:")
  data[:attributes] = {}
  row.each do |k, v|
    data[:attributes][k] = v
  end
end

puts 'Loading from CSV is completed'
