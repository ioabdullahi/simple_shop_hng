import 'package:flutter/material.dart';
import 'package:simple_shop_hng/controllers/checkout_controller.dart';
import 'package:simple_shop_hng/views/checkout_screen.dart';
import 'package:simple_shop_hng/views/order_successful_screen.dart';
import 'package:simple_shop_hng/views/products_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Shop',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: ProductListScreen(),
      routes: {
        '/checkout': (context) => CheckoutScreen(
          checkoutController: CheckoutController(),
          onProductScreenTap: () {},
        ),
        '/order-successful': (context) => OrderSuccessfulScreen(),
      },
    );
  }
}