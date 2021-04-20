import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localserviceapp/controller/BookingController/BookingController.dart';

class MyBookings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 1.sh,
          width: 1.sw,
          child: GetBuilder<BookingController>(
              init: BookingController(),
              builder: (_bookingController) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12.w, top: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(Icons.arrow_back_ios,
                                      color: Colors.black)),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Your Bookings",
                                style: TextStyle(fontSize: 38.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            "Total ${_bookingController.listofBookings.length.toString()} bookings",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 10.sp,
                              fontFamily: "Ubuntu",
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Expanded(
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => ListTile(
                                leading: Container(
                                    height: 50.h,
                                    width: 50.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                        "assets/images/banner_2.jpg",
                                        fit: BoxFit.cover,
                                        height: 100.h,
                                        width: 100.w,
                                      ),
                                    )),
                                title: Text(_bookingController
                                    .listofBookings[index]["title"]),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _bookingController.listofBookings[index]
                                          ["subtitle"],
                                      style: TextStyle(fontSize: 10.sp),
                                      maxLines: 2,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Date : ${_bookingController.listofBookings[index]["date"]}",
                                          style: TextStyle(fontSize: 10.sp),
                                        ),
                                        SizedBox(
                                          width: 8.h,
                                        ),
                                        Text(
                                          "Time : ${_bookingController.listofBookings[index]["time"]}",
                                          style: TextStyle(fontSize: 10.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _bookingController.cancelBooking(index);
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                            fontSize: 10.sp, color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Text(_bookingController
                                    .listofBookings[index]["price"]),
                                isThreeLine: true,
                              ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10.h),
                          itemCount: _bookingController.listofBookings.length),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
