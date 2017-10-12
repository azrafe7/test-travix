package ;

import utest.Runner;
import utest.ui.Report;
import utest.Assert;
import utest.ui.text.PlainTextReport;
import utest.ui.text.PrintReport;

import lib.Lib;


@:keep
class Tests {

  public function new():Void { }
  
  // https://github.com/haxetink/tink_testrunner/blob/d762f78/src/tink/testrunner/Reporter.hx#L168-L177
  inline static public function println(v:String) {
  #if travix
    travix.Logger.println(v);
  #elseif (air || air3)
    flash.Lib.trace(v);
  #elseif (sys || nodejs)
    Sys.println(v);
  #else
    haxe.Log.trace(v);
  #end
  }
  
  static public function exit(code:Int) {
  #if travix
    travix.Logger.exit(code);
  #elseif sys
    Sys.exit(code);
  #else
    println("exit(" + code + ")`. Not supported on this target.");
  #end
  }
  
  static function main() {
    var runner = new Runner();
    runner.addCase(new Tests());
    var report = Report.create(runner);
    runner.run();
    
    // make sure we exit properly, which is necessary on some targets, e.g. flash & (phantom)js
    exit(0);
  }
  
  public function testExceptionPass():Void {
    Assert.isTrue(1. == 1);
    Assert.raises(function ():Void {
      Lib.thisThrows();
    });
  }
  
  public function testWorking():Void {
    Assert.isTrue(Lib.working());
  }
  
  public function testFail():Void {
    Assert.pass();
    Assert.fail();
  }
}