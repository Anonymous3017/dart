void main() {
  var circle = Circle();
  circle.draw();

  var rectangle = Rectangle();
  rectangle.draw();
}

abstract class Shape {
  void draw();
  void myFunction() {
    print('This is my function');
  }
}

class Circle extends Shape {
  void draw() {
    print('Drawing Circle');
  }
}

class Rectangle extends Shape {
  void draw() {
    print('Drawing Rectangle');
  }
}