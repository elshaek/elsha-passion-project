get '/' do
  redirect '/usd'
end

get '/usd' do
  erb :index
end

get '/requestinfo' do
  @total_dice_supply = EtherscanAdapter.new.get_total_dice_supply
  @quarterly_profits_eth = EtherscanAdapter.new.get_bankroll_balance - 5000
  @eth_rate = EtherscanAdapter.new.get_ether_price
  @dice_rate_eth = CryptocompareAdapter.new.dice_value['ETH']
  @dice_rate_usd = CryptocompareAdapter.new.dice_value['USD']
  @dice_rate_idr = CryptocompareAdapter.new.dice_value['IDR']
  @eth_rate_idr = CryptocompareAdapter.new.eth_in_idr['IDR']

  content_type :json
  { total_dice_supply: @total_dice_supply, quarterly_profits_eth: @quarterly_profits_eth, eth_rate: @eth_rate, dice_rate_eth: @dice_rate_eth, dice_rate_usd: @dice_rate_usd, dice_rate_idr: @dice_rate_idr, eth_rate_idr: @eth_rate_idr }.to_json
end

get '/idr' do
  erb :idr
end