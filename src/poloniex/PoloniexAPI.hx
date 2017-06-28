package poloniex;

import haxe.Http;
import haxe.Json;
import poloniex.PoloniexApiMethod;
using tink.CoreApi;

@:final class PoloniexAPI{

  private var PUBLIC_API_URL(default,never) = "https://poloniex.com/public";
  private var publicApi(get,never):Http;

  public function new(){
    
  }

  private function get_publicApi():Http{
    return new Http(this.PUBLIC_API_URL);
  }

  private function queryPublic(params:Map<String,String>):Promise<Dynamic>{
    return Future.async(function(cb){
      var api = this.publicApi;
      for(p in params.keys()) api.setParameter(p, params.get(p));
      api.onError = function(e) cb(Failure(new Error(e)));
      api.onData = function(d) cb(Success(d));
      api.request();
    }) >> function(s){ 
      return try Success(Json.parse(s))
      catch(e:Dynamic) Failure(new Error(s));
    }
  }
  
  public function returnTicker():Promise<Map<String,Ticker>>{
    return this.queryPublic([
      "command" => TICKER
    ]).next(function(vs){
      return Success([ for(c in Reflect.fields(vs)) c => Ticker.parse(c, Reflect.field(vs, c))]);
    });
  }

  public function return24Volume():Promise<Volume24h>{
    return this.queryPublic([
      "command" => VOL_24H
    ]).next(function(vs){
      return Success(Volume24h.parse(vs));
    });
  }

  public function returnOrderBook(currencyPair:String, depth:Int=10):Promise<Orderbook>{
    return this.queryPublic([
      "command" => ORDER_BOOK,
      "currencyPair" => currencyPair,
      "depth" => '$depth'
    ]).next(function(vs){
      return Success(Orderbook.parse(vs));
    });
  }

  public function returnTradeHistory(currencyPair:String, start:Int, end:Int):Promise<Array<TradeHistory>>{
    return this.queryPublic([
      "command" => TRADE_HISTORY,
      "currencyPair" => currencyPair,
      "start" => '$start',
      "end" => '$end',
    ]).next(function(vs:Array<Dynamic>){
      return Success([ for(c in vs) TradeHistory.parse(vs)]);
    });
  }

  public function returnChartData(currencyPair:String, period:Int, start:Int, end:Int, period:Int=14400):Promise<Array<ChartData>>{
    // Valid Range values are 300,900,1800,7200,14400,86400
    return this.queryPublic([
      "command" => CHART_DATA,
      "currencyPair" => currencyPair,
      "start" => '$start',
      "end" => '$end',
      "period" => '$period',
    ]).next(function(vs:Array<Dynamic>){
      return Success([ for(c in vs) ChartData.parse(vs)]);
    });
  }

  public function returnCurrencies():Promise<Map<String,Currency>>{
    return this.queryPublic([
      "command" => CURRENCIES
    ]).next(function(vs){
      return Success([ for(c in Reflect.fields(vs)) c => Currency.parse(c, Reflect.field(vs, c))]);
    });
  }

  public function returnLoanOrders(currency:String):Promise<LoanOrders>{
    return this.queryPublic([
      "command" => LOAN_ORDERS,
      "currency" => currency
    ]).next(function(vs){
      return Success(LoanOrders.parse(vs.offers, vs.demands));
    });
  }

  // TODO: Trading API Methods

}
