import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localserviceapp/view/Authentication/Login.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: 0.75.sw,
                child: Text("Welcome To Local Service App",
                    style: TextStyle(
                        fontSize: 38.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Comfortaa",
                        height: 1.5),
                    textAlign: TextAlign.center),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10.w),
              width: 0.5.sw,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () {
                  Get.offAll(Login());
                },
                child: Text(
                  "Next      👉",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
