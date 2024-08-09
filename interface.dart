void main() {
  var eng1 = Engineer();
  eng1.display();
  eng1.walk();
}

class Employee{
  void display() {
    print('I am working as an engineer in this company');
  }
}

class Person{
  void walk() {
    print('I am walking...');
  }
}

class Engineer implements Employee, Person {
  void display() {
    print('I am working here');
  }

  void walk() {
    print('I am walking here');
  }
}