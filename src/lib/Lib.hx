package lib;


class Lib {
  static public function thisThrows():Void {
    trace("throwing...");
    throw("Exception");
  }
  
  static public function working():Bool {
    trace("working");
    return true;
  }
}