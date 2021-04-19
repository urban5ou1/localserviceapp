import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';

class DashboardController extends GetxController {
  PersistentTabController controller;

  List<Map<String, dynamic>> listOfServices = [
    {
      "title": "Laptop & PC Repairing",
      "color": [0xffED4264, 0xffFFEDBC]
    },
    {
      "title": "Garden Cleaning",
      "color": [0xffDC2424, 0xff4A569D]
    },
    {
      "title": "Plumbing",
      "color": [0xff24C6DC, 0xff514A9D]
    },
    {
      "title": "Kitchen Furniture",
      "color": [0xff3D7EAA, 0xffFFE47A]
    },
    {
      "title": "Vehicle Repairing",
      "color": [0xff232526, 0xff414345]
    },
    {
      "title": "Teaching",
      "color": [0xffED4264, 0xffD7DDE8]
    },
    {
      "title": "Painting",
      "color": [0xff642B73, 0xffc6426e]
    },
    {
      "title": "MakeUp & Hairstyling",
      "color": [0xff1c92d2, 0xfff2fcfe]
    },
  ];

  List<String> listOfBanner = [
    "assets/images/banner_1.jfif",
    "assets/images/banner_2.jpg",
    "assets/images/banner_3.jpg",
    "assets/images/banner_4.png",
  ];

  @override
  void onInit() {
    controller = PersistentTabController(initialIndex: 0);
    super.onInit();
  }
}
