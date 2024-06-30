import 'package:flutter/material.dart';
import '../controllers/checkout_controller.dart';
import 'order_successful_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final CheckoutController checkoutController;
  final VoidCallback onProductScreenTap;

  CheckoutScreen(
      {required this.checkoutController, required this.onProductScreenTap});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      widget.onProductScreenTap();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: widget.checkoutController.checkoutItems.isEmpty
          ? Center(
              child: Text('Your cart is empty. Add products to checkout.'),
            )
          : ListView.builder(
              itemCount: widget.checkoutController.checkoutItems.length,
              itemBuilder: (context, index) {
                final product = widget.checkoutController.checkoutItems[index];
                return ListTile(
                  leading: Icon(Icons.shopping_bag, color: Colors.teal),
                  title: Text(product.name),
                  subtitle: Text('\₦${product.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      setState(() {
                        widget.checkoutController.removeItem(product);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${product.name} removed from cart'),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    },
                    color: Colors.red,
                  ),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (widget.checkoutController.checkoutItems.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text('Cart is empty. Add products before checking out.'),
                backgroundColor: Colors.redAccent,
              ),
            );
          } else {
            setState(() {
              widget.checkoutController.clearItems();
            });
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderSuccessfulScreen()),
            );
          }
        },
        child: Icon(Icons.check),
        tooltip: 'Complete Order',
        backgroundColor: Colors.teal,
      ),
    );
  }
}
