class ChartsController < ApplicationController
  include ChartsConcern

  before_action :load_ticker_values
  before_action :prepare_chart_params


  def index
    yf_service = YahooFinance.new(@chart_params, 'AAPL')
    @chart_data = yf_service.call(:chart_data)
    get_candlestick_data
  end

  def update_chart_data

  end

  private

  def load_ticker_values
    @tickers = Ticker.all
  end

  def prepare_chart_params
    range = params[:range] || DEFAULT_RANGE
    interval = params[:interval] || DEFAULT_INTERVAL
    @chart_params = {range: range, interval: interval, region: REGION, lang: LANGUAGE }
  end

end
