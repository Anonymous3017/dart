void main() {
  //create an object of the class
  Person person1 = Person('Ayush', 20);
  person1.displayInfo();
}

//Deffining a claa
class Person {
  String name;
  int age;

  //constructor for the class
  Person(this.name, this.age);

  //method for the class
  void displayInfo(){
    print('Name: $name');
    print('Age: $age');
  }
}