import 'package:get/get.dart';
import 'package:planty_shop/core/viewmodels/auth_view_model.dart';
import 'package:planty_shop/core/viewmodels/cart_view_model.dart';
import 'package:planty_shop/core/viewmodels/control_view_model.dart';
import 'package:planty_shop/core/viewmodels/home_view_model.dart';
import 'package:planty_shop/helper/local_storage_data.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
  }
}
