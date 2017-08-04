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
  $(".bold").on("DOMNodeInserted", function() {
    $(".bold").css("background-color", "lightgrey");
  });
};

$(document).ready(function() {
  inputTextboxListener();
  dataChangeListener();
});

var requestData = function(){
  var sendGetRequest = $.get('/requestinfo');

  sendGetRequest.done(function(response) {
    $('#quarterly-profits-usd').html('$' + (response['eth_rate']*response['quarterly_profits_eth']).formatMoney(2));
    $('#quarterly-profits-eth').html(response['quarterly_profits_eth'].toFixed(6) + 'ETH');
    $('#current-eth-rate').html('$' + response['eth_rate'].formatMoney(2));
    $('#current-dice-rate').html(response['dice_rate_eth'].toFixed(6) + 'ETH');
  });
}; 

window.setInterval(function(){requestData()}, 1000);
