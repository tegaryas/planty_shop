import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planty_shop/core/viewmodels/profile_view_model.dart';
import 'package:planty_shop/view/auth/login_view.dart';
import 'package:planty_shop/view/widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Scaffold(
                body: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                    image: DecorationImage(
                                      image: controller.userModel == null
                                          ? AssetImage(
                                              'assets/images/avatar.png')
                                          : controller.userModel.pic ==
                                                  'default'
                                              ? AssetImage(
                                                  'assets/images/avatar.png')
                                              : NetworkImage(
                                                  controller.userModel.pic),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: controller.userModel.name,
                                      fontSize: 22,
                                      color: Colors.black,
                                    ),
                                    CustomText(
                                      text: controller.userModel.email,
                                      fontSize: 17,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: FlatButton(
                              child: ListTile(
                                title: CustomText(
                                  text: 'Menu',
                                  fontSize: 35,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: FlatButton(
                              child: ListTile(
                                title: CustomText(
                                  text: 'Edit Profile',
                                ),
                                leading: Icon(
                                  Icons.mode_edit,
                                  color: Colors.lightGreen,
                                ),
                                trailing: Icon(
                                  Icons.navigate_next,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: FlatButton(
                              child: ListTile(
                                title: CustomText(
                                  text: 'Alamat',
                                ),
                                leading: Icon(
                                  Icons.home,
                                  color: Colors.lightGreen,
                                ),
                                trailing: Icon(
                                  Icons.navigate_next,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: FlatButton(
                              child: ListTile(
                                title: CustomText(
                                  text: 'Riwayat Pesanan',
                                ),
                                leading: Icon(
                                  Icons.history,
                                  color: Colors.lightGreen,
                                ),
                                trailing: Icon(
                                  Icons.navigate_next,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: FlatButton(
                              child: ListTile(
                                title: CustomText(
                                  text: 'Kartu Anda',
                                ),
                                leading: Icon(
                                  Icons.credit_card_rounded,
                                  color: Colors.lightGreen,
                                ),
                                trailing: Icon(
                                  Icons.navigate_next,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: FlatButton(
                              child: ListTile(
                                title: CustomText(
                                  text: 'Notifikasi',
                                ),
                                leading: Icon(
                                  Icons.notification_important,
                                  color: Colors.lightGreen,
                                ),
                                trailing: Icon(
                                  Icons.navigate_next,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: FlatButton(
                              child: ListTile(
                                title: CustomText(
                                  text: 'Log Out',
                                ),
                                leading: Icon(
                                  Icons.exit_to_app,
                                  color: Colors.lightGreen,
                                ),
                                trailing: Icon(
                                  Icons.navigate_next,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                controller.signOut();
                                Get.offAll(LoginView());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
