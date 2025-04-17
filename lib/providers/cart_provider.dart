import 'dart:convert';
import 'package:app_ban_giay/models/shoe_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  final List<ShoeInCart> _cartItems = [];

  List<ShoeInCart> get cartItems => _cartItems;

  CartProvider() {
    _loadCart();
  }

  void addItem(ShoeInCart item) {
    final existedItem = _cartItems.firstWhere(
          (element) => element.id == item.id,
      orElse: () => ShoeInCart.defaultConstructor(),
    );
    if (existedItem.id.isNotEmpty) {
      existedItem.quantity++;
    } else {
      _cartItems.add(item);
    }
    _saveCart();
    notifyListeners();
  }

  void removeItem(ShoeInCart item) {
    _cartItems.remove(item);
    _saveCart();
    notifyListeners();
  }

  void removeItemById(String id) {
    _cartItems.removeWhere((item) => item.id == id);
    _saveCart();
    notifyListeners();
  }

  void removeMultipleFromCart(List<String> ids) {
    _cartItems.removeWhere((item) => ids.contains(item.id));
    _saveCart();
    notifyListeners();
  }

  void increaseQuantity(String id) {
    final index = _cartItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      _cartItems[index].quantity++;
      _saveCart();
      notifyListeners();
    }
  }

  void decreaseQuantity(String id) {
    final index = _cartItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
      } else {
        _cartItems.removeAt(index);
      }
      _saveCart();
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    _saveCart();
    notifyListeners();
  }

  void _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = _cartItems.map((item) => item.toJson()).toList();
    await prefs.setString('cart', jsonEncode(cartData));
  }

  void _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = prefs.getString('cart');
    if (cartString != null) {
      final List<ShoeInCart> cartData = (jsonDecode(cartString) as List)
          .map((item) => ShoeInCart.fromJson(item))
          .toList();
      _cartItems.addAll(cartData);
      notifyListeners();
    }
  }

  // 👉 Tổng số tiền trong giỏ hàng
  double get totalPrice {
    return _cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);
  }

  // 👉 Tổng số lượng sản phẩm
  int get totalItems {
    return _cartItems.fold(0, (sum, item) => sum + item.quantity);
  }
}
