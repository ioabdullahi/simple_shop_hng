// lib/views/widgets/checkout_item.dart
import 'package:flutter/material.dart';
import 'package:simple_shop_hng/models/products_model.dart';

class CheckoutItem extends StatelessWidget {
  final ProductsModel product;
  final VoidCallback onRemove;

  CheckoutItem({required this.product, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: Icon(Icons.remove_shopping_cart),
        onPressed: onRemove,
      ),
    );
  }
}