import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planty_shop/core/viewmodels/auth_view_model.dart';
import 'package:planty_shop/view/auth/login_view.dart';
import 'package:planty_shop/view/widgets/custom_button.dart';
import 'package:planty_shop/view/widgets/custom_text.dart';
import 'package:planty_shop/view/widgets/custom_textformfield.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.off(LoginView());
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            right: 20,
            left: 20,
          ),
          child: Form(
            key: _fromKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Daftar',
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: 'Buat Akun untuk Login',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  hint: 'Username',
                  onSave: (value) {
                    controller.name = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('ERROR');
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hint: 'Email',
                  onSave: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('ERROR');
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hint: 'Password',
                  onSave: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('ERROR');
                    }
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                CustomButton(
                  onPress: () {
                    _fromKey.currentState.save();
                    if (_fromKey.currentState.validate()) {
                      controller.signUpWithEmailAndPassword();
                    }
                  },
                  text: 'Buat Akun',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
