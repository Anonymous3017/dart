void main() {
  // Accessing Elements in a List in Dart

  // 1. elementAt(int index)
  // The elementAt method returns the element at the specified index.

  List<int> numbers = [1, 2, 3, 4, 5];
  print('\nOriginal list is $numbers');

  print('\nElement at index 2 is ${numbers.elementAt(2)}');

  // 2. first

  print('\nFirst element of the list is ${numbers.first}');

  // 3. last

  print('\nLast element of the list is ${numbers.last}');

  // 4. single

  List<int> singleElementList = [1];
  print('\nSingle element list is ${singleElementList.single}');

  

  // Checking for Elements in a List in Dart

  //   1. contains(Object element)
  // The contains method checks if the list contains the specified element.
  
  print('\nDoes the list contains 3? ${numbers.contains(3)}');

  // 2. indexOf(Object element, [int start = 0])
  // The indexOf method returns the index of the first occurrence of the specified element, starting from the optional start index.

  print('\nIndex of 3 in the list is ${numbers.indexOf(3)}');

  // 3. lastIndexOf(Object element, [int start])
  // The lastIndexOf method returns the index of the last occurrence of the specified element, starting from the optional start index.

  List<int> repeatedNumbers = [1, 2, 3, 4, 5, 3, 6, 7, 3, 8, 9];
  print('\nIndex of last occurrence of 3 in the list is ${repeatedNumbers.lastIndexOf(3)}');

  // 4. any(bool test(E element))
  // The any method returns true if any element in the list satisfies the given condition.

  print('\nDoes the list contains any even number? ${numbers.any((element) => element % 2 == 0)}'); 

  // 5. isEmpty
  // The isEmpty property returns true if the list is empty.

  List<int> emptyList = [];
  print('\nIs the list empty? ${emptyList.isEmpty}');

  // 6. isNotEmpty`
  // The isNotEmpty property returns true if the list is not empty.

  print('\nIs the list not empty? ${numbers.isNotEmpty}');
  print('\nIs the list not empty? ${emptyList.isNotEmpty}');
}
