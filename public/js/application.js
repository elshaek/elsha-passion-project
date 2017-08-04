Number.prototype.formatMoney = function(c, d, t){
var n = this, 
    c = isNaN(c = Math.abs(c)) ? 2 : c, 
    d = d == undefined ? "." : d, 
    t = t == undefined ? "," : t, 
    s = n < 0 ? "-" : "", 
    i = String(parseInt(n = Math.abs(Number(n) || 0).toFixed(c))), 
    j = (j = i.length) > 3 ? j % 3 : 0;
   return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
 };


var inputTextboxListener = function() {
  $(".dice-token-count").on("change", function() {
    var userInput = $(this).val();
    $(".dice-token-count").val(userInput);
  });
};

var dataChangeListener = function() {
  $(document).on("DOMNodeInserted", ".bold", function() {
    $(".bold").removeClass("flash");
    // $(".bold").fadeTo(50, 0.5, function() { $(this).fadeTo(350, 1.0); });
    // $(".bold").toggle( "highlight" )
  });
};


$(document).ready(function() {
  inputTextboxListener();
  dataChangeListener();
});

var requestData = function(){
  var sendGetRequest = $.get('/requestinfo');

  sendGetRequest.done(function(response) {
    var userTokenInput = parseInt($(".dice-token-count").val());
    var quarterlyProfitsUsd = (response['eth_rate'] * response['quarterly_profits_eth']).formatMoney(2);
    var quarterlyProfitsIdr = (response['eth_rate_idr'] * response['quarterly_profits_eth']).formatMoney(2);

    var userShare = userTokenInput / response['total_dice_supply'];
    var quarterlyDividendDollar = (userShare * response['eth_rate'] * response['quarterly_profits_eth']).formatMoney(2);
    var quarterlyDividendRupiah = (userShare * response['eth_rate_idr'] * response['quarterly_profits_eth']).formatMoney(2);
    var quarterlyDividendEth = (userShare * response['quarterly_profits_eth']).toFixed(6);

    var totalValueDollar = (userTokenInput * response['dice_rate_usd']).formatMoney(2);
    var totalValueRupiah = (userTokenInput * response['dice_rate_idr']).formatMoney(2);
    var totalValueEth = (userTokenInput * response['dice_rate_eth']).toFixed(6);



    $('#quarterly-profits-usd').html('Rp. ' + quarterlyProfitsIdr);
    $('#quarterly-profits-eth').html(response['quarterly_profits_eth'].toFixed(6) + 'ETH');

    $('#quarterly-dividend-dollar').html('$' + quarterlyDividendDollar);
    $('#quarterly-dividend-rupiah').html('Rp. ' + quarterlyDividendRupiah);
    $('#quarterly-dividend-eth').html(quarterlyDividendEth + 'ETH');

    $('#total-value-dollar').html('$' + totalValueDollar);
    $('#total-value-rupiah').html('Rp. ' + totalValueRupiah);
    $('#total-value-eth').html(totalValueEth + 'ETH');

    $('#current-eth-rate').html('$' + response['eth_rate'].formatMoney(2));
    $('#current-eth-rate-idr').html('Rp. ' + response['eth_rate_idr'].formatMoney(2));
    $('#current-dice-rate').html(response['dice_rate_eth'].toFixed(6) + 'ETH');
  });
}; 

window.setInterval(function(){requestData()}, 500);
