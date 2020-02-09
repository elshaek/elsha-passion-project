class EtherscanAdapter
  include HTTParty

  base_uri 'api.etherscan.io'

  def initialize
    @api_key = ENV['ETHERSCAN_API_KEY']
  end

  def get_total_dice_supply
    @total_dice_supply_options = { query: { 'module': 'stats', 'action': 'tokensupply', 'contractaddress': '0x2e071D2966Aa7D8dECB1005885bA1977D6038A65', 'apikey': @api_key }}
    response = self.class.get("/api", @total_dice_supply_options)
    return response["result"].to_f / 10000000000000000
  end

  def get_bankroll_balance
    @bankroll_balance_options = { query: { 'module': 'account', 'action': 'balance', 'tag': 'latest', 'address': '0xa52e014b3f5cc48287c2d483a3e026c32cc76e6d', 'apikey': @api_key }}
    response = self.class.get("/api", @bankroll_balance_options)
    return response["result"].to_f / 1000000000000000000
  end

  def get_ether_price
    # @ether_price_options = { query: { 'module': 'stats', 'action': 'ethprice', 'apikey': @api_key }}
    # response = self.class.get("/api", @ether_price_options)
    # return response["result"]["ethusd"].to_f

    response = HTTParty.get("https://api.etherscan.io/api?module=stats&action=ethprice&apikey=#{@api_key}")

    return response["result"]["ethusd"].to_f
  end
end