import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planty_shop/core/viewmodels/auth_view_model.dart';
import 'package:planty_shop/core/viewmodels/control_view_model.dart';
import 'package:planty_shop/view/auth/login_view.dart';
import 'package:planty_shop/view/widgets/custome_text_navbar.dart';

class ControllView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginView()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: _bottomNavigationBar(),
              ),
            );
    });
  }

  Widget _bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.put(ControlViewModel()),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomTextNavBar(
                text: 'Beranda',
                alignment: Alignment.center,
                color: Colors.lightGreen,
              ),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Icon(Icons.home),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomTextNavBar(
                text: 'Keranjang',
                alignment: Alignment.center,
                color: Colors.lightGreen,
              ),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Icon(Icons.shopping_bag),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomTextNavBar(
                text: 'Akun',
                alignment: Alignment.center,
                color: Colors.lightGreen,
              ),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Icon(Icons.account_circle),
            ),
          ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: Colors.lightGreen,
        backgroundColor: Colors.grey.shade50,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
