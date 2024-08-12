void main() {
  //Sorting a List in Dart

  // 1. sort([int compare(E a, E b)])
  // The sort method sorts the list in ascending order. The optional compare function can be used to customize the sorting order.

  List<int> numbers = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5];
  print('\nOriginal list is $numbers');

  numbers.sort();
  print('\nSorted list is $numbers');

  // 2. sort((a, b) => b.compareTo(a))
  // To sort the list in descending order, you can use the compare function (a, b) => b.compareTo(a).

  numbers.sort((a, b) => b.compareTo(a));
  print('\nSorted list in descending order is $numbers');

  // 3. sort((a, b) => a - b)
  // You can also use the compare function (a, b) => a - b to sort the list in ascending order.

  numbers.sort((a, b) => a - b);
  print('\nSorted list in ascending order is $numbers');

  // Shuffling a List in Dart

  // 1. shuffle([Random random])
  // The shuffle method shuffles the list in random order. The optional random parameter can be used to provide a custom random number generator.

  numbers.shuffle();
  print('\nShuffled list is $numbers');

  // Reversing a List in Dart


  // 1. reversed 
  // The reversed property returns an iterable that iterates over the list in reverse order.

  // A shoted list
  List<int> sortedNumbers = [1, 2, 3, 4, 5];
  List<int> reversedNumbers = sortedNumbers.reversed.toList();
  print('\nReversed list is $reversedNumbers');
}