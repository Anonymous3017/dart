import 'dart:collection';

void main() {
  // Map Definition
  // A map is an unordered collection of key-value pairs.

  Map<String, int> ages = Map();
  ages["Ayush"] = 21;
  ages["Ravi"] = 24;

  print(ages);
  // Operations on Map
  // The Map interface provides a basic set of operations, such as put, remove, containsKey, and size.

  // Add/Update an element:
  ages["Ayush"] = 22;
  print(ages);

  // Remove an element:
  ages.remove("Ravi");
  print(ages);

  // Check if a key is present:
  print(ages.containsKey("Ayush"));

  // Check if a value is present:
  print(ages.containsValue(22));

  // Get the size of the map:
  print(ages.length);

  // Add more items to the map:
  ages.addAll({"Ravi": 24, "Rahul": 25, "Rohit": 26});

  // Iterate over the map:
  ages.forEach((key, value) {
    print("$key: $value");
  });

  // Clear the map:
  ages.clear();
  print(ages);

  // HashMap
  // A HashMap is an unordered collection of key-value pairs.

  HashMap<String, int> salaries = HashMap();

  salaries["Ayush"] = 25000;
  salaries["Ravi"] = 30000;

  print(salaries);

  // Operations on HashMap
  // The HashMap class provides a concrete implementation of the Map interface using a hash table.

  // Add/Update an element:
  salaries["Ayush"] = 26000;
  print(salaries);

  // Remove an element:
  salaries.remove('Ravi');
  print(salaries);

  // Check if a key is present:
  print(salaries.containsKey("Ayush"));

  // Check if a value is present:
  print(salaries.containsValue(26000));

  // Get the size of the map:
  print(salaries.length);

  // Add more items to the map:
  salaries.addAll({"Ravi": 30000, "Rahul": 35000, "Rohit": 40000});

  // Iterate over the map:
  salaries.forEach((key, value) {
    print("$key: $value");
  });

  // Clear the map:
  salaries.clear();

  // Check if the map is empty:
  print(salaries.isEmpty);

  // Check if the map is not empty:
  print(salaries.isNotEmpty);

  // How map is different form HashMap
  // The main difference between Map and HashMap is that
  //Map is an abstract class that provides a skeletal implementation of the Map interface,
  //while HashMap is a concrete class that implements the Map interface using a hash table.

  // The Map interface provides a basic set of operations, such as put, remove, containsKey, and size,
  // while the HashMap class provides a concrete implementation of the Map interface using a hash table.

  // The HashMap class is more efficient than the Map interface for most operations,
  // as it uses a hash table to store the key-value pairs, which allows for constant-time access to the elements.

  // The Map interface is useful when you want to create a custom implementation of a map,
  // while the HashMap class is useful when you want to use a hash table to store the key-value pairs of the map.

  // In general, you should use the HashMap class when you need a map implementation that is efficient for most operations,
  // and use the Map interface when you need a custom implementation of a map.
}
