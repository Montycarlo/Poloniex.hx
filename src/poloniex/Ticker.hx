package poloniex;

class Ticker{

  public var currencyPair:String;
  public var id:Int;
  public var low24hr:String;
  public var highestBid:String;
  public var isFrozen:String;
  public var baseVolume:String;
  public var percentChange:String;
  public var high24hr:String;
  public var last:String;
  public var quoteVolume:String;
  public var lowestAsk:String;

  public function new(currencyPair:String){
    this.currencyPair = currencyPair;
  }

  public static function parse(currencyPair:String, vs:Dynamic){
    var t = new Ticker(currencyPair);
    t.id = vs.id;
    t.low24hr = vs.low24hr;
    t.highestBid = vs.highestBid;
    t.isFrozen = vs.isFrozen;
    t.baseVolume = vs.baseVolume;
    t.percentChange = vs.percentChange;
    t.high24hr = vs.high24hr;
    t.last = vs.last;
    t.quoteVolume = vs.quoteVolume;
    t.lowestAsk = vs.lowestAsk;
    return t;
  }

}
