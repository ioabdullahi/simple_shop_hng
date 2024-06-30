import 'package:simple_shop_hng/models/products_model.dart';

class CheckoutController {
  List<ProductsModel> _checkoutItems = [];

  List<ProductsModel> get checkoutItems => _checkoutItems;

  void addItem(ProductsModel product) {
    _checkoutItems.add(product);
  }

  void removeItem(ProductsModel product) {
    _checkoutItems.remove(product);
  }

  void clearItems() {
    _checkoutItems.clear();
  }
}