// importing Hashset
import 'dart:collection';

// Difference between Set and HashSet
// The main difference between Set and HashSet is that Set is 
//an abstract class that provides a skeletal implementation of the Set interface, 
//while HashSet is a concrete class that implements the Set interface using a hash table.

// The Set interface provides a basic set of operations, such as add, remove, contains, and size,

// The HashSet class provides a concrete implementation of the Set interface using a hash table.

// The HashSet class is more efficient than the Set interface for most operations,
// as it uses a hash table to store the elements, which allows for constant-time access to the elements.

// The Set interface is useful when you want to create a custom implementation of a set,
// while the HashSet class is useful when you want to use a hash table to store the elements of the set.

// In general, you should use the HashSet class when you need a set implementation that is efficient for most operations,
// and use the Set interface when you need a custom implementation of a set.

// Examples of using Set and HashSet in Dart
// In the example, we create two sets, names and names2, using the Set and HashSet classes, respectively.


void main() {
  // Set Definition
  // A set is an unordered collection of unique items. 

  Set<String> names = Set();
  names.add("John");
  names.add("Doe");
  names.add("Smith");
  names.add("Alex");
  names.add("John");
  names.add("Doe");
  names.add("Smith");
  names.add("Alex");
  print(names);

  //Hashset
  // A HashSet is an unordered collection of unique items.

  HashSet<String> names2 = HashSet();
  names2.add("John");
  names2.add("Doe");
  names2.add("Smith");
  names2.add("Alex");
  names2.add("John");
  names2.add("Doe");
  names2.add("Smith");
  names2.add("Alex");
  print(names2);
}
