import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localserviceapp/controller/Authentication/AuthenticationController.dart';
import 'package:localserviceapp/view/Authentication/Login.dart';

class Register extends StatelessWidget {
  final _authenticationController = Get.find<AuthenticationController>();
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _registrationFormKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account ? ",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(Login());
                            },
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w900),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Form(
                      key: _registrationFormKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) => (value == null ||
                                    value.isEmpty ||
                                    !value.isEmail)
                                ? "Please enter correct email"
                                : null,
                            controller:
                                _authenticationController.getEmailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(),
                                hintText: "jane@example.com",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          TextFormField(
                            validator: (value) => (value == null ||
                                    value.isEmpty ||
                                    value.length < 6)
                                ? "Please enter atlease 6 digit long password"
                                : null,
                            controller:
                                _authenticationController.getPasswordController,
                            obscureText: true,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                labelText: "Password",
                                border: OutlineInputBorder(),
                                hintText: "••••••••••••",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          TextFormField(
                            validator: (value) => (value == null ||
                                    value.isEmpty ||
                                    value.length < 6)
                                ? "Please enter atlease 6 digit long password"
                                : null,
                            controller: _authenticationController
                                .getConfirmPasswordController,
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                labelText: "Confirm Password",
                                border: OutlineInputBorder(),
                                hintText: "••••••••••••",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 0.1.sh,
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10.w),
                      width: 0.8.sw,
                      height: 60.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.black),
                        onPressed: () {
                          _authenticationController
                              .verifyRegistration(_registrationFormKey);
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
