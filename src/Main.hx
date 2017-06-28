package;

import poloniex.*;
using tink.CoreApi;

@:final class Main{

	public static function main():Void{

    var api = new PoloniexAPI();

    api.returnTicker().handle(function(t){
      switch(t){
        case Success(s):
          trace("Succeeded!");
          trace(s);
        case Failure(f):
          trace("Failed :(");
      }
    });

    api.return24Volume().handle(function(t){
      switch(t){
        case Success(s):
          trace('Total BTC Traded: ${s.totalBTC}!');
        case Failure(f):
          trace("Failed :(");
      }
    });

    api.returnCurrencies().handle(function(t){
      switch(t){
        case Success(s):
          trace(s.get("BTC").name);
        case Failure(f):
          trace("Failed :(");
      }
    });
	}

}
