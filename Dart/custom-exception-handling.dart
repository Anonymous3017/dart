void main() {
  //Custom Exception Handling in Dart
  try {
    checkNumber(-10);
  } catch (e) {
    var msg = checkNegativeException();
    print(msg.errorMessage());
  } finally {
    print('This block always executes');
  }
}

class checkNegativeException implements Exception {
  String errorMessage() {
    return 'Number cannot be negative';
  }
}

void checkNumber(int number) {
  if (number < 0) {
    throw new checkNegativeException();
  }
}
