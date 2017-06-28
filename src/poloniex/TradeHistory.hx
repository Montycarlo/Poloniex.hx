package poloniex;

class TradeHistory{

  public var globalTradeID:Int;
  public var tradeID:Int;
  public var date:String;
  public var type:String;
  public var rate:String;
  public var amount:String;
  public var total:String;

  public function new(){
  }

  public static function parse(vs:Dynamic){
    var t = new TradeHistory();
    t.globalTradeID = vs.globalTradeID;
    t.tradeID = vs.tradeID;
    t.date = vs.date;
    t.type = vs.type;
    t.rate = vs.rate;
    t.amount = vs.amount;
    t.total = vs.total;
    return t;
  }

}
