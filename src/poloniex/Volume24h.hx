package poloniex;

class Volume24h{

  public var totalBTC:String;
  public var totalETH:String;
  public var totalUSDT:String;
  public var totalXMR:String;
  public var totalXUSD:String;
  public var vols:Map<String,Dynamic>;

  public function new(){}

  public static function parse(vs:Dynamic){
    var t = new Volume24h();
    t.totalBTC = vs.totalBTC;
    t.totalETH = vs.totalETH;
    t.totalUSDT = vs.totalUSDT;
    t.totalXMR = vs.totalXMR;
    t.totalXUSD = vs.totalXUSD;
    var fs = Reflect.fields(vs).filter(function(v){
      return ["totalBTC","totalETH","totalUSDT","totalXMR","totalXUSD"].indexOf(v) == -1;
    });
    t.vols = [ for(f in fs) f => Reflect.field(vs, f) ];
    return t;
  }
}
