void main() {
  greet('Ayush');
  print(addNum(2, 3));

  //calling function with positional parameters
  greetUser('Ayush', 20);

  //calling function with named parameters
  greetUserAgain('Ayush', age: 20, salary: 20000.0);
  

  //calling function with default parameters
  heyUser('Ayush', age: 30);
}

//Function without return type  
void greet(String name) {
  print('Hello $name');
}

//Function with return type
int addNum(int a, int b) {
  return a + b;
}

// function with optional positional parameters
void greetUser(String name, [var age, dynamic salary]) {
  print('Hello $name');
  print('Age: $age');
  print('Salary: $salary');
}
// function with optional named parametersvoid 
void greetUserAgain(String name, {var age, dynamic salary}) {
  print('Hello $name');
  print('Age: $age');
  print('Salary: $salary');
}

// Function with default parameters
void heyUser(String name, {var age = 20, dynamic salary = 20000.0}) {
  print('\nHello $name');
  print('Age: $age');
  print('Salary: $salary');
}

