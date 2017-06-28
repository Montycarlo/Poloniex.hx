package poloniex;

class Currency{

  public var id:Int;
  public var shortName:String;
  public var name:String;
  public var txFee:String;
  public var minConf:Int;
  public var depositAddress:String;
  public var disabled:Int;
  public var delisted:Int;
  public var frozen:Int;

  public function new(shortName:String, name:String){
    this.shortName = shortName;
    this.name = name;
  }

  public static function parse(name:String, vs:Dynamic){
    var t = new Currency(name, vs.name);
    t.id = vs.id;
    t.txFee = vs.txFee;
    t.minConf = vs.minConf;
    t.depositAddress = vs.depositAddress;
    t.disabled = vs.disabled;
    t.delisted = vs.delisted;
    t.frozen = vs.frozen;
    return t;
  }

}
