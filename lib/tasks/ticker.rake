# namespace :ticker do
#   task add_ticker_data: :environment do
#     puts "Ticker count #{TICKER_DATA.count}"
#     TICKER_DATA.each do |ticker|
#       puts "Symbol ... #{ticker[:Symbol]}"
#       Ticker.find_or_create_by(symbol: ticker[:Symbol], name: ticker[:Name], sector: ticker[:Sector], industry: ticker[:Industry])
#     end
#   end
# end
