void main() {
  var name = "Ayush";
  int age = 20;
  print('so the person name is $name and its age is $age');
  dynamic first = 12;
  dynamic second = 45.5;
  print(first + second);
  print('the quick brown fox jumps over the lazy dog');

  // Final keyword without datatype in dart
  final firstName = "Ayush";
  // name1 = "Ayush Gupta"; // This will give an error
  final String lastname = "Gupta";
  print('The name of the person is $firstName $lastname');

  // Const keyword in dart

}

class student {
  final String name = "Ayush";
  // const int age = 20; // This will give an error you have to set static keyword
  static const int age = 20;
  
}