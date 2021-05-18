import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localserviceapp/view/Dashboard/Dashboard.dart';
import 'package:localserviceapp/view/NavigatorScreen/NavigatorScreen.dart';

class AuthenticationController extends GetxController {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  TextEditingController get getEmailController => _emailController;
  TextEditingController get getPasswordController => _passwordController;
  TextEditingController get getConfirmPasswordController =>
      _confirmPasswordController;

  void verifyRegistration(GlobalKey<FormState> _registrationFormKey) {
    if (_registrationFormKey.currentState.validate() &&
        (_passwordController.text == _confirmPasswordController.text)) {
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
      Get.to(NavigatorScreen());
    }
  }

  void verifyLogin(GlobalKey<FormState> _loginFormKey) {
    if (_loginFormKey.currentState.validate()) {
      _emailController.clear();
      _passwordController.clear();
      Get.to(NavigatorScreen());
    }
  }
}
