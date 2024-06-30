import 'package:flutter/material.dart';
import 'package:simple_shop_hng/controllers/checkout_controller.dart';
import 'package:simple_shop_hng/controllers/products_controller.dart';
import 'package:simple_shop_hng/views/checkout_screen.dart';
import 'package:simple_shop_hng/views/widgets/product_item.dart';


class ProductListScreen extends StatelessWidget {
  final ProductController productController = ProductController();
  final CheckoutController checkoutController = CheckoutController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: ListView.builder(
        itemCount: productController.products.length,
        itemBuilder: (context, index) {
          final product = productController.products[index];
          return ProductItem(
            product: product,
            onAdd: () {
              checkoutController.addItem(product);
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
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckoutScreen(checkoutController: checkoutController)),
            );
          }
        },
      ),
    );
  }
}