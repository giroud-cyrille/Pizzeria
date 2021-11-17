import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:pizzeria_good/models/product.dart';
import 'package:collection/collection.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem(this.product, [this.quantity = 1]);
}

class Cart extends ChangeNotifier {
  List<CartItem> _products = [];

  int itemAmount() => _products.length;

  void addProduct(Product product) {
    int index = getCartItemIndex(product);
    if(index == -1) {
      _products.add(CartItem(product));
    }
    else {
      _products[index].quantity++;
    }

    notifyListeners();
  }

  void removeProduct(Product product) {
    int index = getCartItemIndex(product);
    if(index != -1) {
      CartItem item = _products[index];

      if(--item.quantity == 0) {
        _products.removeAt(index);
      }
    }

    notifyListeners();
  }

  CartItem getCartItem(int index) {
    return _products[index];
  }

  int getCartItemIndex(Product product) {
    return _products.indexWhere((element) => element.product.id == product.id && element.product.type == product.type);
  }

  double total() {
    double sum = 0;
    for(CartItem item in _products) {
      sum += item.product.price * item.quantity;
    }

    return sum;
  }
}