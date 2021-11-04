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
    @chart_params = {range: "1d", region: "US", lang: "en", interval: "5m"}
  end

end
