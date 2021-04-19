import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localserviceapp/controller/Authentication/AuthenticationController.dart';
import 'package:localserviceapp/view/Dashboard/Dashboard.dart';
import 'package:localserviceapp/view/Splash/Splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthenticationController());
  runApp(
    GetMaterialApp(
      theme: ThemeData(fontFamily: "Comfortaa"),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        title: 'Local Service App',
        home: DashBoard(),
      ),
    );
  }
}
