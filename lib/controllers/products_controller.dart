import 'package:simple_shop_hng/models/products_model.dart';

class ProductController {
  List<ProductsModel> _products = [
    ProductsModel(id: '1', name: 'Product 1', price: 10.0),
    ProductsModel(id: '2', name: 'Product 2', price: 20.0),
  ];

  List<ProductsModel> get products => _products;
}
