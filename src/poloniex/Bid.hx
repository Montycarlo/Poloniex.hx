package poloniex;

class Bid{

  public var price:String;
  public var quantity:Float;
  
  public function new(){}

  public static function parse(vs:Array<Dynamic>){
    var b = new Bid();
    b.price = vs[0];
    b.quantity = vs[1];
    return b;
  }

}
