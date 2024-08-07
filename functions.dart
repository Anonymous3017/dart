void main() {
  greet('Ayush');
  print(addNum(2, 3));
}

//Function without return type  
void greet(String name) {
  print('Hello $name');
}

//Function with return type
int addNum(int a, int b) {
  return a + b;
}