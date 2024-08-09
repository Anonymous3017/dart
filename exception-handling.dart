

void main() {
  // Exception Handling in Dart

  // 1. try-catch block
  // try {
  //   // code that may throw an exception
  //   var result = 12 ~/ 0; // truncated division that round fractions towards zero
  //   print('The result is $result');
  // } catch (e) {
  //   // code to handle the exception
  //   print('The exception thrown is $e');
  // }

  // 2. on block
  // try {
  //   // code that may throw an exception
  //   var result = 12 ~/ 0; // truncated division that round fractions towards zero
  //   print('The result is $result');
  // } on IntegerDivisionByZeroException {
  //   // code to handle the exception
  //   print('Cannot divide by zero');
  // }

  // 3. Exception Handling using Stack Trace
  // try {
  //   // code that may throw an exception
  //   var result = 12 ~/ 0; // truncated division that round fractions towards zero
  //   print('The result is $result');
  // } catch (e, s) {
  //   // code to handle the exception
  //   print('The exception thrown is $e');
  //   print('Stack Trace: $s');
  // }

  // 4. finally block
  try {
    // code that may throw an exception
    var result = 12 ~/ 4; // truncated division that round fractions towards zero
    print('The result is $result');
  } catch (e) {
    // code to handle the exception
    print('The exception thrown is $e');
  } finally {
    print('This block always executes');
  }
}