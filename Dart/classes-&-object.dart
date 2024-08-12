void main() {
  var std1 = Student.customConstructor();
  std1.id = 1;
  std1.name = 'Ayush';
  print('ID: ${std1.id} \nName: ${std1.name}');
  std1.study();
  std1.sleep();
  std1.eat();

  var std2 = Student.customConstructor();
  print('ID: ${std2.id} \nName: ${std2.name}');
  std2.study();
  std2.sleep();
  std2.eat();
}

// Defining a class
class Student {
  var id;
  var name;

  // Default constructor
  // Student() {
  //   print('This is a default constructor');
  //   this.id = 0;
  //   this.name = 'Unknown';
  // }

  // Parameterized constructor
  // Student(this.id, this.name);

  // Custom named constructor
  Student.customConstructor() {
    print('This is a custom constructor');
  }

  void study() {
    print('${this.name} is studying');
  }

  void sleep() {
    print('${this.name} is sleeping');
  }

  void eat() {
    print('${this.name} is eating');
  }
}
