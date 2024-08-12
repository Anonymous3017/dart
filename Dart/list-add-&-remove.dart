void main() {
  List<String> alist = ['This', 'is', 'a', 'list', 'of', 'strings'];
  print(alist);

  //Adding Elements to a List in Dart
  /*
  1. add(E value)
  The add method is used to add a single element to the end of the list.
   */

  List<int> numbers = [1, 2, 3, 4, 5];
  print('\nOriginal list is $numbers');

  numbers.add(6);
  print('\nList after adding an element is $numbers');

  /*
  2. addAll(Iterable<E> iterable)
  The addAll method is used to add all elements of the given iterable to the end of the list.
   */

  numbers.addAll([7, 8, 9]);
  print('\nList after adding multiple elements is $numbers');

  // 3. insert(int index, E element)
  // The insert method is used to insert an element at the specified index.

  numbers.insert(0, 0);
  print('\nList after inserting an element at index 0 is $numbers');

  // 4. insertAll(int index, Iterable<E> iterable)
  // The insertAll method is used to insert all elements of the given iterable at the specified index.
   numbers.insertAll(10, [10, 11, 12]);
   print('\nList after inserting multiple elements at index 11 is $numbers');

   //Removing Elements from a List in Dart
  //  1. remove(Object value)
  // The remove method removes the first occurrence of the specified value from the list.

  numbers.remove(0);
  print('\nList after removing an element is $numbers');

  // 2. removeAt(int index)
  // The removeAt method removes the element at the specified index from the list.

  numbers.removeAt(numbers.length - 1);
  print('\nList after removing an element at index 11 is $numbers');

  // 3. removeLast()
  // The removeLast method removes the last element from the list.

  numbers.removeLast();
  print('\nList after removing the last element is $numbers');

  // 4. removeRange(int start, int end)
  // The removeRange method removes the elements in the specified range from the list.

  numbers.removeRange(0, 4);
  print('\nList after removing elements in the range 0-4 is $numbers');

  // 5. removeWhere(bool test(E element))
  // The removeWhere method removes all elements that satisfy the given condition.

  numbers.removeWhere((element) => element % 2 == 0);
  print('\nList after removing even elements is $numbers');

  // 6. retainWhere(bool test(E element))
  // The retainWhere method retains only the elements that satisfy the given condition.

  numbers.retainWhere((element) => element % 5 != 0);
  print('\nList after retaining even elements is $numbers');

}
