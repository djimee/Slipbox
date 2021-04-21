Airbrake.configure do |config|
  config.api_key = '5363c8a9b00ecded9c6708201a9146b6'
  config.host    = 'errbit.hut.shefcompsci.org.uk'
  config.port    = 443
  config.secure  = config.port == 443
end