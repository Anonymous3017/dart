// Lexical closure is a function object that has access to variables in its lexical scope, 
//even when the function is used outside of its original scope.

void main() {
  // Lexical Closure in Dart
  Function adder(int addBy) {
    return (int i) => addBy + i;
  }

  var add2 = adder(2);
  print(add2(3)); // Output: 5

  var add4 = adder(4);
  print(add4(3)); // Output: 7
}

// A lexical closure is a function object that retains access to variables from its lexical scope, 
//even when the function is executed outside of that original scope. 
//This is a powerful feature in many programming languages, 
//including Dart, as it allows functions to "remember" the environment in which they were created.

// In the main function, we define another function called adder that takes an integer parameter addBy. 
//The adder function returns an anonymous function (a closure) that takes another integer i and returns the sum of addBy and i.
// The key point here is that the returned anonymous function retains access to the addBy variable, 
//even after the adder function has finished executing.

// We then create two instances of this closure by calling adder with different arguments. 
//The first instance, add2, is created by calling adder(2), and the second instance, add4, is created by calling adder(4). 
//When we call add2(3), it returns 5 because it adds 2 (the value of addBy when add2 was created) to 3. 
//Similarly, calling add4(3) returns 7 because it adds 4 to 3.

// This example illustrates how closures can capture and use variables from their surrounding scope, 
//enabling more flexible and powerful function definitions.