class CryptocompareAdapter
  def dice_value
    url = URI("https://min-api.cryptocompare.com/data/price?fsym=DICE&tsyms=ETH%2CUSD%2CIDR")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)

    response = JSON.parse(http.request(request).body)
    return response
  end

  def eth_in_idr
    url = URI("https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=IDR")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)

    response = JSON.parse(http.request(request).body)
    return response
  end
end