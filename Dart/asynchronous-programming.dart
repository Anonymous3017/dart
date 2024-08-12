import 'dart:async';

// Function that returns a Future
Future<String> fetchUserOrder() {
  // Simulating a network delay
  return Future.delayed(Duration(seconds: 8), () {
    print('${DateTime.now()}: Order fetched');
    return 'Cappuccino';
  });
}

void main() {
  print('${DateTime.now()}: Main started');

  // Using then to handle the Future
  fetchUserOrder().then((order) {
    print('${DateTime.now()}: Your order is: $order');
  }).catchError((error) {
    print('${DateTime.now()}: Sorry, we are out of $error');
  });

  // Using async await
  printOrder();
}

Future<void> printOrder() async {
  print('${DateTime.now()}: printOrder started');
  try {
    String order = await fetchUserOrder();
    print('${DateTime.now()}: Your order is: $order');
  } catch (error) {
    print('${DateTime.now()}: Sorry, we are out of $error');
  }
}