class AClass {
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