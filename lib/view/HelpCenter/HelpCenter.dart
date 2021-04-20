import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 1.sh,
          width: 1.sw,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/help_banner.png",
                    height: 300.h,
                    width: 1.sw,
                    fit: BoxFit.cover,
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10.h),
                          Text(
                            "24/7",
                            style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.w800,
                                fontSize: 18.sp),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Help Center",
                            style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.w900,
                                fontSize: 38.sp),
                          ),
                        ],
                      ))
                ],
              ),
              Text("Tell us how we can help👋",
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Ubuntu",
                      color: Colors.indigo.shade900)),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: 0.75.sw,
                child: Text(
                  "Our crew of superheroes are standing by for service and support",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: "Ubuntu",
                      color: Colors.indigo.shade900),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 28.w),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/support_person.png",
                              height: 70.h,
                              width: 70.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Chat",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: "Ubuntu",
                                    color: Colors.indigo.shade900,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "Start a conversation now!",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: "Ubuntu",
                                    color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 28.w),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/faqs_image.jpg",
                              height: 60.h,
                              width: 60.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "FAQs",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: "Ubuntu",
                                    color: Colors.indigo.shade900,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "Find intelligent answers instantly",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: "Ubuntu",
                                    color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 28.w),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/email_support.png",
                              height: 60.h,
                              width: 60.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: "Ubuntu",
                                    color: Colors.indigo.shade900,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "Get solutions beamed to your inbox",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: "Ubuntu",
                                    color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
