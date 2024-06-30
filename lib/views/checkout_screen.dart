import 'package:flutter/material.dart';
import '../controllers/checkout_controller.dart';
import 'widgets/checkout_item.dart';
import 'order_successful_screen.dart';

class CheckoutScreen extends StatelessWidget {
  final CheckoutController checkoutController;

  CheckoutScreen({required this.checkoutController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: ListView.builder(
        itemCount: checkoutController.checkoutItems.length,
        itemBuilder: (context, index) {
          final product = checkoutController.checkoutItems[index];
          return CheckoutItem(
            product: product,
            onRemove: () {
              checkoutController.removeItem(product);
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Checkout',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          checkoutController.clearItems();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OrderSuccessfulScreen()),
          );
        },
        child: Icon(Icons.check),
        tooltip: 'Complete Order',
      ),
    );
  }
}