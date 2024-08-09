void main() {
  Function addNum = (int a, int b) => print(a + b);
  myFunction("This is for adding two Numbers", addNum);
}

void myFunction (dynamic msg, Function myFunc) {
  print(msg);
  myFunc(5, 5);
}