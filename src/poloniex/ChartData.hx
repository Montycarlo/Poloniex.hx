package poloniex;

class ChartData{

  public var date:Int;
  public var high:Float;
  public var low:Float;
  public var open:Float;
  public var close:Float;
  public var volume:Float;
  public var quoteVolume:Float;
  public var weightedAverage:Float;

  public function new(){
  }

  public static function parse(vs:Dynamic){
    var t = new ChartData();
    t.date = vs.date;
    t.high = vs.high;
    t.low = vs.low;
    t.open = vs.open;
    t.close = vs.close;
    t.volume = vs.volume;
    t.quoteVolume = vs.quoteVolume;
    t.weightedAverage = vs.weightedAverage;
    return t;
  }

}
