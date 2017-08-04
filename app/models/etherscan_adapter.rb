class EtherscanAdapter
  include HTTParty

  base_uri 'api.etherscan.io'

  def initialize
    @api_key = ENV['ETHERSCAN_API_KEY']
  end

  def get_total_dice_supply
    @total_dice_supply_options = { query: { 'module': 'stats', 'action': 'tokensupply', 'contractaddress': '0x2e071D2966Aa7D8dECB1005885bA1977D6038A65', 'apikey': @api_key }}
    response = self.class.get("/api", @total_dice_supply_options)
    return response["result"].to_f / 1000000000000000
  end

  def get_bankroll_balance
    @bankroll_balance_options = { query: { 'module': 'account', 'action': 'balance', 'tag': 'latest', 'address': '0xEce701C76bD00D1C3f96410a0C69eA8Dfcf5f34E', 'apikey': @api_key }}
    response = self.class.get("/api", @bankroll_balance_options)
    return response["result"].to_f / 1000000000000000000
  end

  def get_ether_price
    @ether_price_options = { query: { 'module': 'stats', 'action': 'ethprice', 'apikey': @api_key }}
    response = self.class.get("/api", @ether_price_options)
    return response["result"]["ethusd"].to_f
  end
end
