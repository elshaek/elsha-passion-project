get '/' do
  erb :index
end

get '/requestinfo' do
  @quarterly_profits_eth = EtherscanAdapter.new.get_bankroll_balance - 1200
  @eth_rate = EtherscanAdapter.new.get_ether_price
  @dice_rate_eth = CryptocompareAdapter.new.dice_value['ETH']
  @dice_rate_usd = CryptocompareAdapter.new.dice_value['USD']

  content_type :json
  { quarterly_profits_eth: @quarterly_profits_eth, eth_rate: @eth_rate, dice_rate_eth: @dice_rate_eth }.to_json
end