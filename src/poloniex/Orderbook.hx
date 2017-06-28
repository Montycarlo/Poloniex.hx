package poloniex;

class Orderbook{

  public var asks:Array<Ask>;
  public var bids:Array<Bid>;
  public var isFrozen:Int;
  public var seq:Int;

  public function new(){
  }

  public static function parse(vs:Dynamic){
    var t = new Orderbook();
    t.asks = vs.asks;
    t.bids = vs.bids;
    t.isFrozen = vs.isFrozen;
    t.seq = vs.seq;
    return t;
  }

}
