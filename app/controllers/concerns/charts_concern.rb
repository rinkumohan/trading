module ChartsConcern
  require 'date'

  def get_candlestick_data
    find_quote_and_timestamp
    candlestick_data
    candlestick_options
  end

  private

  def find_quote_and_timestamp
    candlestick_data = @chart_data["chart"]["result"][0]
    @quote = candlestick_data["indicators"]["quote"][0]
    @timestamps = candlestick_data["timestamp"]
  end

  def candlestick_data
    @candlestick_data = @timestamps.map.with_index{|timestamp, i| [Time.at(timestamp).to_datetime, ohlc(i)]}.to_h
  end

  def ohlc(i) #abbreviate of open, high, low, close (ohlc)
    open = @quote["open"][i]
    high = @quote["high"][i]
    low = @quote["low"][i]
    close = @quote["close"][i]
    [open, high, low, close]
  end

  def candlestick_options
    @candlestick_options = {
      plot_options: {
        candlestick: {
          colors: {
            upward: '#3C90EB',
            downward: '#DF7D46'
          }
        }
      }
    }
  end
end
