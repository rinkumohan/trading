YF_API_DOMAIN = ENV.fetch('YF_DOMAIN')
YF_API_KEY = ENV.fetch('YF_API_KEY')
VALID_RANGES =  [
                  "1d",
                  "5d",
                  "1mo",
                  "3mo",
                  "6mo",
                  "1y",
                  "2y",
                  "5y",
                  "10y",
                  "ytd",
                  "max"
                ]

VALID_GRANULARITIES = ["1m", "5m", "1d"]
REGION = "US"
LANGUAGE = "en"
DEFAULT_RANGE = "1d"
DEFAULT_INTERVAL = "5m"
