package poloniex;

@:enum abstract PoloniexApiMethod(String) to String{
  var TICKER = "returnTicker";
  var VOL_24H = "return24hVolume";
  var ORDER_BOOK = "returnOrderBook";
  var TRADE_HISTORY = "returnTradeHistory";
  var CHART_DATA = "returnChartData";
  var CURRENCIES = "returnCurrencies";
  var LOAN_ORDERS = "returnLoanOrders";
}
