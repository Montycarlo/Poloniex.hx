package poloniex;

class LoanOrders{

  public var offers:Array<LoanOrder>;
  public var demands:Array<LoanOrder>;

  public function new(){
  }

  public static function parse(offers:Array<Dynamic>, demands:Array<Dynamic>){
    var t = new LoanOrders();
    t.offers = [ for(o in offers) LoanOrder.parse(o) ];
    t.demands = [ for(o in demands) LoanOrder.parse(o) ];
    return t;
  }

}
