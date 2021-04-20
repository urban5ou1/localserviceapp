import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BookingController extends GetxController {
  List<Map<String, dynamic>> listofBookings = [
    // {
    //   "image": "assets/images/banner_1.jfif",
    //   "title": "Saloon at Home",
    //   "time_date": "",
    //   "price": "₹ 550.00/-"
    // },
  ];

  void cancelBooking(int index) {
    listofBookings.removeAt(index);
    update();
  }
}
