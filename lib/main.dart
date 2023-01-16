/**
 * 
 *  First example
 * 
 * class AClass {
  static void aStaticMethod() {} // A static method
  void anInstanceMethod() {} // An instance method
}

main() {
  /// we can declare any function inside any top-level function
  Function anyFunctionInsideTopLevelFunction;

  // Comparing static methods.
  anyFunctionInsideTopLevelFunction = AClass.aStaticMethod;
  if (AClass.aStaticMethod == anyFunctionInsideTopLevelFunction) {
    print('Any function inside a top level function '
        ' is as same as a static method.');
  }
}

// flutter: Any function inside a top level function  is as same as a static method.


 * 
 * 
 */

class AClass {
  static void aStaticMethod() {} // A static method
  void anInstanceMethod() {} // An instance method
}

main() {
  /// we can declare any function inside any top-level function
  Function anyFunctionInsideTopLevelFunction;
  var firstInstanceOfAClass = AClass(); // first Instance of AClass
  var secondInstanceOfAClass = AClass(); // second Instance of AClass

  var aVariable = secondInstanceOfAClass;
  anyFunctionInsideTopLevelFunction = secondInstanceOfAClass.anInstanceMethod;

  // These closures refer to the second instance,
  // so they're equal.
  if (aVariable.anInstanceMethod == anyFunctionInsideTopLevelFunction) {
    print('These closures refer to the second instance,'
        ' so they\'re equal.');
  }

  // These closures refer to different instances,
  // so they're unequal.
  if (firstInstanceOfAClass.anInstanceMethod !=
      secondInstanceOfAClass.anInstanceMethod) {
    print('These closures refer to different instances,'
        ' so they\'re unequal.');
  }
}

// flutter: These closures refer to the second instance, so they're equal.
// flutter: These closures refer to different instances, so they're unequal.