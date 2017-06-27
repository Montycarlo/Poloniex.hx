package;

import poloniex.*;
using tink.CoreApi;

@:final class Main{

	@async public static function main():Void{

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

	}

}
