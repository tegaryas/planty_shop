import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planty_shop/core/services/home_service.dart';
import 'package:planty_shop/models/product_model.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  HomeViewModel() {
    getAllProducts();
  }

  getAllProducts() async {
    _loading.value = true;
    HomeServices().getProduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data()));

        _loading.value = false;
      }
      update();
    });
  }
}
