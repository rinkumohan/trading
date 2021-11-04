class ChartsController < ApplicationController
  include ChartsConcern

  before_action :prepare_chart_params

  def index
    yf_service = YahooFinance.new(@chart_params, 'AAPL')
    @chart_data = yf_service.call(:chart_data)
    get_candlestick_data
  end

  private

  def prepare_chart_params
    range = params[:range] || DEFAULT_RANGE
    interval = params[:interval] || DEFAULT_INTERVAL
    @chart_params = {range: range, interval: interval, region: REGION, lang: LANGUAGE }
  end

end
