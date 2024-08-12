void main() {
  int num = 0;

  if (num > 0) {
    print('poditive hai');
  } else if(num < 0 ) {
    print('negative hai');
  } else {
    print('garam hai, garam hai');
  }
  // conditional statements in dart
  // Ternary operator 
  // condition ? expr1 : expr2

  10 > 20 ? print('10 is greater than 20') : print('20 is greater than 10');

  // Switch case in dart
  // switch (expression) {
  //   case value1:
  //     // Statements
  //     break;
  //   case value2:
  //     // Statements
  //     break;
  //   default:
  //     // Statements
  // }

  String grade = 'A';

  switch (grade) {
    case 'A':
      print('Excellent');
      break;
    case 'B':
      print('Good');
      break;
    case 'C':
      print('Fair');
      break;
    case 'D':
      print('Poor');
      break;
    default:
      print('Invalid grade');
  }

  // Null checking expression
  // expr1 ?? expr2

  var name = null;
  // name = 'Ayush';
  String username = name ?? 'Guest User';
  print(username);


}