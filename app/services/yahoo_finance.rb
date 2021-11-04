class YahooFinance

  def initialize(request_params={}, ticker)
    @ticker = ticker
    @request_params = request_params
    @headers = {'Content-Type' => 'application/json', 'X-API-KEY' => YF_API_KEY}
  end

  def call(action)
    public_send action
  end

  def chart_data
    url = "#{YF_API_DOMAIN}/finance/chart/#{@ticker}"
    HTTParty.get(url, query: @request_params, headers: @headers, timeout: 80 )
  end
end
