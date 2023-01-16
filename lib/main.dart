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


 * Second example
 * 
 * 
 * class AClass {
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
 * 
 * 
 */

void aTopLevelFunction() {} // A top-level function

class AClass {
  static void aStaticMethod() {} // A static method
  void anInstanceMethod() {} // An instance method
}

main() {
  /// Every app must have a top-level main() function,
  /// which serves as the entrypoint to the app.
  /// The main() function returns void
  /// it has an optional List<String> parameter for arguments.

  /// everything in Dart is Object
  /// even functions are objects and have a type, Function
  ///

  /// All functions return a value. If no return value is
  /// specified, the statement return null
  ///
  catchYou() {}

  if (catchYou() == null) {
    print('It returns null.');
  }

  /// we can declare any function inside any top-level function

  Function anyFunctionInsideTopLevelFunction;

  // Comparing top-level functions.
  anyFunctionInsideTopLevelFunction = aTopLevelFunction;
  if (aTopLevelFunction == anyFunctionInsideTopLevelFunction) {
    print('A top level function is same as any function '
        ' inside a top-level function.');
  }

  // Comparing static methods.
  anyFunctionInsideTopLevelFunction = AClass.aStaticMethod;
  if (AClass.aStaticMethod == anyFunctionInsideTopLevelFunction) {
    print('Any function inside a top level function '
        ' is as same as a static method.');
  }

  // Comparing instance methods.
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
    /**
    // output

    flutter: It returns null.
flutter: A top level function is same as any function  inside a top-level function.
flutter: Any function inside a top level function  is as same as a static method.
flutter: These closures refer to the second instance, so they're equal.
flutter: These closures refer to different instances, so they're unequal.


    */
