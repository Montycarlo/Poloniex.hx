package poloniex;

class LoanOrder{

  public var rate:String;
  public var amount:String;
  public var rangeMin:Int;
  public var rangeMax:Int;

  public function new(){
  }

  public static function parse(vs:Dynamic){
    var t = new LoanOrder();
    t.rate = vs.rate;
    t.amount = vs.amount;
    t.rangeMin = vs.rangeMin;
    t.rangeMax = vs.rangeMax;
    return t;
  }

}
