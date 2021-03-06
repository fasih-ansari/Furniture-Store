import 'package:ecommerce_app/models/cart_attr.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartAttr> _cartItems = {};

  Map<String, CartAttr> get getCartItems {
    return {..._cartItems};
  }

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addProductToCart(
      String productId, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (existingCartItem) => CartAttr(
            id: existingCartItem.id,
            title: existingCartItem.title,
            price: existingCartItem.price,
            quantity: existingCartItem.quantity + 1,
            imageUrl: existingCartItem.imageUrl),
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartAttr(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1,
            imageUrl: imageUrl),
      );
    }
    notifyListeners();
  }

  void reduceItemByOne(
      String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (existingCartItem) => CartAttr(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity - 1,
              imageUrl: existingCartItem.imageUrl));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
