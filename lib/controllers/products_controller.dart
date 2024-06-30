import 'package:flutter/material.dart';
import 'package:simple_shop_hng/models/products_model.dart';

class ProductController {
  List<ProductsModel> _products = [
    ProductsModel(id: '1', name: 'Product 1', price: 10.0),
    ProductsModel(id: '2', name: 'Product 2', price: 20.0),
    ProductsModel(id: '3', name: 'Product 3', price: 10.0),
    ProductsModel(id: '4', name: 'Product 4', price: 20.0),
    ProductsModel(id: '5', name: 'Product 5', price: 10.0),
    ProductsModel(id: '6', name: 'Product 6', price: 20.0),
  ];

  List<ProductsModel> get products => _products;
}
