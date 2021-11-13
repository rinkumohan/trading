class ChartsController < ApplicationController
  include ChartsConcern

  before_action :load_ticker_values, only: [:index]
  before_action :prepare_chart_params


  def index
    get_candlestick_chart_data
  end

  def update_chart_data
    get_candlestick_chart_data
  end

  private

  def get_candlestick_chart_data
    yf_service = YahooFinance.new(@chart_params, @ticker)
    @chart_data = yf_service.call(:chart_data)
    get_candlestick_data
  end

  def load_ticker_values
    @tickers = Ticker.all
  end

  def prepare_chart_params
    @ticker = params[:ticker] || DEFAULT_TICKER
    @range = params[:range] || DEFAULT_RANGE
    @interval = params[:interval] || DEFAULT_INTERVAL
    @chart_params = {range: @range, interval: @interval, region: REGION, lang: LANGUAGE }
  end

end
