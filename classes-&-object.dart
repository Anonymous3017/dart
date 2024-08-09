void main() {
  var std1 = Student();
  std1.id = 1;
  std1.name = 'Ayush';
  print('ID: ${std1.id} \nName: ${std1.name}');
  std1.study();
  std1.sleep();
  std1.eat();

  var std2 = Student();
  std2.id = 2;
  std2.name = 'Mohit';
  print('ID: ${std2.id} \nName: ${std2.name}');
  std2.study();
  std2.sleep();
  std2.eat();

}

//Defining a class
class Student {
  var id = null;
  var name = null;

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