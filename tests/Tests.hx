package ;

import lib.Lib;


class Tests {

  // https://github.com/haxetink/tink_testrunner/blob/d762f78/src/tink/testrunner/Reporter.hx#L168-L177
  inline static public function println(v:String) {
  #if travix
    travix.Logger.println(v);
  #elseif (air || air3)
    flash.Lib.trace(v);
  #elseif (sys || nodejs)
    Sys.println(v);
  #else
    throw "Not supported yet";
  #end
  }
    
  static function main() {
    println('it works');
    
  #if travix
    travix.Logger.exit(0); // make sure we exit properly, which is necessary on some targets, e.g. flash & (phantom)js
  #end
  }
  
}