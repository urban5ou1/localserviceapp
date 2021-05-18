import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 150.h,
                width: 120.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/images/user.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "John",
                style: TextStyle(fontSize: 38.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "SAN FRANSISCO, CA",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: 0.8.sw,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () {},
                  child: Text(
                    "EDIT",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: 0.8.sw,
                height: 50.h,
                child: RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {},
                  child: Text(
                    "ABOUT",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
