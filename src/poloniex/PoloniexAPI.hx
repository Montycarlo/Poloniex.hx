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
    // https://poloniex.com/public?command=return24hVolume
    return new Error(0, "");
  }

  public function returnOrderBook(depth:Int, currencyPair:String):Promise<Orderbook>{
    //https://poloniex.com/public?command=returnOrderBook&currencyPair=BTC_NXT&depth=10
    return new Error(0, "");
  }

  public function returnTradeHistory(currencyPair:String, start:Int, end:Int):Promise<TradeHistory>{
    // https://poloniex.com/public?command=returnTradeHistory&currencyPair=BTC_NXT&start=1410158341&end=1410499372
    return new Error(0, "");
  }

  public function returnChartData(currencyPair:String, period:Int, start:Int, end:Int):Promise<ChartData>{
    //  https://poloniex.com/public?command=returnChartData&currencyPair=BTC_XMR&start=1405699200&end=9999999999&period=14400
    return new Error(0, "");
  }

  public function returnCurrencies():Promise<CurrencyMap>{
    // https://poloniex.com/public?command=returnCurrencies
    return new Error(0, "");
  }

  public function returnLoanOrders(currencyPair:String):Promise<LoanOrders>{
    // https://poloniex.com/public?command=returnLoanOrders&currency=BTC
    return new Error(0, "");
  }

  // TODO: Trading API Methods

}
