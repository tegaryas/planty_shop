import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:planty_shop/constants.dart';
import 'package:planty_shop/core/services/database/cart_database_helper.dart';
import 'package:planty_shop/models/cart_product_model.dart';
import 'package:planty_shop/models/product_model.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;
  int get totalPrice => _totalPrice;
  int _totalPrice = 0;
  var dbHelper = CartDatabaseHelper.db;
  CartViewModel() {
    getAllProduct();
  }
  getAllProduct() async {
    _loading.value = true;

    _cartProductModel = await dbHelper.getAllProduct();
    print(_cartProductModel.length);
    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (int.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity);
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        return;
      }
    }
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalPrice +=
        (int.parse(cartProductModel.price) * cartProductModel.quantity);
    update();
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity++;
    _totalPrice += (int.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);
    // print(columnProductId);
    update();
  }

  decreaseQuantity(int index) async {
    _cartProductModel[index].quantity--;
    _totalPrice -= (int.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);

    update();
  }

  delete(int index) async {
    await dbHelper.deleteProductWithId(_cartProductModel[index]);
    update();
  }
}
