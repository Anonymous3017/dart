void main() {
  // Labels in Dart
  // You can label a loop in Dart using the label: identifier syntax.
  // The label can be used with break and continue statements to control the flow of the loop.

  // Syntax
  // label: for (var i = 0; i < 5; i++) {
  //   // Statements
  // }
  /*

  outerLoop: for (var i = 0; i < 5; i++) {
    innerLoop: for (var j = 0; j < 5; j++) {
      if (i == 2 && j == 2) {
        break outerLoop;
      }
      print('i = $i, j = $j');
    }
  }
  */

  // The break statement with a label breaks out of the loop with the specified label.
  // In the above example, the break outerLoop statement breaks out of the outer loop when i is 2 and j is 2.

  //some more examples
  outerLoop: for (var i = 0; i < 5; i++) {
    // ignore: unused_label
    innerLoop: for (var j = 0; j < 5; j++) {
      if (i == 2 && j == 2) {
        continue outerLoop;
      }
      print('i = $i, j = $j');
    }
  }

  // The continue statement with a label skips the current iteration of the loop with the specified label.
  // In the above example, the continue outerLoop statement skips the current iteration of the outer loop when i is 2 and j is 2.
}