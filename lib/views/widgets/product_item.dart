import 'package:flutter/material.dart';
import 'package:simple_shop_hng/models/products_model.dart';

class ProductItem extends StatelessWidget {
  final ProductsModel product;
  final VoidCallback onAdd;

  ProductItem({required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: Icon(Icons.add_shopping_cart),
        onPressed: onAdd,
      ),
    );
  }
}