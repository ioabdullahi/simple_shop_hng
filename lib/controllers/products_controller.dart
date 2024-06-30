import 'package:simple_shop_hng/models/products_model.dart';

class ProductController {
  List<ProductsModel> _products = [
    ProductsModel(id: '1', name: 'Laptop', price: 500.0),
    ProductsModel(id: '2', name: 'iPhone', price: 300.0),
    ProductsModel(id: '3', name: 'Samsung', price: 200.0),
    ProductsModel(id: '4', name: 'Tecno', price: 150.0),
    ProductsModel(id: '5', name: 'Infinix', price: 120.0),
    ProductsModel(id: '6', name: 'RedMi', price: 190.0),
  ];

  List<ProductsModel> get products => _products;
}
