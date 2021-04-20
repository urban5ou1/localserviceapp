import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import 'package:localserviceapp/controller/BookingController/BookingController.dart';
import 'package:localserviceapp/view/MyBookings/MyBookings.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ServiceListController extends GetxController {
  String setTime, setDate;

  String hour, minute, time;

  String dateTime;

  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  final _bookingController = Get.find<BookingController>();

  var services = {
    "laptop_services": [
      {
        "title": "Virus Removal",
        "subtitle":
            "In this service computer technicians ensure that the virus will be removed without risking the important data or information on your computer. You can also get virus removal services online, as well as complete services that include all the steps that are required to get your computer up and running problem-free.",
        "price": "₹ 500.00"
      },
      {
        "title": "Hardware Repairs",
        "subtitle":
            "This is for physical damages that are incurred by the computer or its accessories. This includes installing new hardware, repair or updating hardware, etc.",
        "price": "₹1500.00"
      },
      {
        "title": "Accessories Repair",
        "subtitle":
            "There are many computer accessories like scanners and printers which might need repair due to damage. A professional computer technician that specializes in computer hardware will be able to fix such issues.",
        "price": "₹1500.00"
      },
      {
        "title": "Data Recovery & Backup",
        "subtitle":
            "Sometimes, due to issues such as hardware crashes or a virus, your important data might get lost. It might not possible for you to recover the data, but professional computer technicians can recover the data by tracking information. This is an extremely sensitive issue, therefore, you should choose a highly qualified company. If you hire a company just because they have a low rate, it might result in permanent loss of important data and also make it impossible for an experienced technician to recover data.",
        "price": "₹ 3500.00"
      },
      {
        "title": "Maintenance Services",
        "subtitle":
            "Your home and business computers require constant updating and tune-ups. This regular maintenance will not only enhance the working speed of your computer, but it will also increase its lifetime. Maintenance service includes file cleanup, upgrading and installing new windows or programs and general inspections.",
        "price": "₹ 1500.00"
      },
      {
        "title": "Customization",
        "subtitle":
            "If you know what you need but can’t find it in stock computers, you can ask a computer technician to build a customized computer for you with specific features according to you or your company’s needs.",
        "price": "₹ 3500.00"
      },
      {
        "title": "Tutoring/Training",
        "subtitle":
            "If you have installed software and your business team is new to it, you can hire a computer company to effectively train your staff. These teachers have in-depth knowledge of programs and will save time by passing over the learning curve.",
        "price": "₹ 10,000.00"
      },
    ],
    "garden_cleaning": [
      {
        "title": "FERTILIZING AND PEST CONTROL",
        "subtitle":
            "Fertilizing and pest control are both very involved processes that require a lot of knowledge and multiple products as well as a good amount of time invested. Most landscaping, gardening, and lawn care companies have extensive knowledge of fertilizers and pest control options. Most companies also have both organic and non-organic options.",
        "price": "₹2500.00"
      },
      {
        "title": "GARDEN MAINTENANCE",
        "subtitle":
            "Garden maintenance is a fun but time consuming task. Most gardening companies offer a wide range of services to help keep your garden at tip-top shape. If you don’t have time to get your hands in the dirt this season, consider hiring a garden maintenance service to lend a helping hand.",
        "price": "₹1500.00"
      },
      {
        "title": "HOLIDAY DECORATION",
        "subtitle":
            "Every year, several different holidays come around that make us want to decorate our outdoor areas to spread the joy of the season to neighbors and passers by. Many landscaping companies can take over these tasks for you when you don’t have the time. Setting up some spooky decor during October to prepare for Halloween and stringing Christmas lights are a tradition that many folks want to continue, even when they don’t have the time to do it themselves. There’s no shame in hiring a professional to take on the task for you when you don’t have the time or energy.",
        "price": "₹ 3500.00"
      },
      {
        "title": "INSTALLATION SERVICES",
        "subtitle":
            "Want to add a feature to your garden getaway? Landscaping, Lawn and Garden Care companies can help install just about anything. ",
        "price": "₹ 1500.00"
      },
      {
        "title": "SPRING YARD CLEAN-UP",
        "subtitle":
            "Spring time is the busiest season for gardeners. After the season wraps up, there is much to be done to prepare for the next season and to clean up the clutter. Why not let a team of professionals whip your lawn and garden into shape for you?",
        "price": "₹ 4500.00"
      },
      {
        "title": "TREE-TRIMMING & REMOVAL",
        "subtitle":
            "Trees need to be trimmed every now and then to keep them out of the way of power lines and to keep them from growing into structures like your home or shed. Sometimes, trees need to be removed entirely. Whether from lightning damage, or simply clearing a space for a new installation, sometimes a tree needs to go. No matter how strong you and your children may be, this is usually a task for professionals. ",
        "price": "₹ 2500.00"
      },
      {
        "title": "WATERING (WHILE YOU ARE AWAY)",
        "subtitle":
            "When you are on vacation or have to be out of town for work, you can schedule watering services to keep your plants alive while you are away.",
        "price": "₹ 1000.00"
      },
    ]
  };

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) selectedDate = picked;
    dateController.text = DateFormat.yMd().format(selectedDate);
    update();
  }

  Future<Null> selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) selectedTime = picked;
    hour = selectedTime.hour.toString();
    minute = selectedTime.minute.toString();
    time = hour + ' : ' + minute;
    timeController.text = time;
    timeController.text = formatDate(
        DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
        [hh, ':', nn, " ", am]).toString();
    update();
  }

  void onServiceBook(Map<String, dynamic> selectedService, context) {
    Map<String, dynamic> newSelectedService = {
      ...selectedService,
      "time": "${timeController.text}",
      "date": "${dateController.text}"
    };
    _bookingController.listofBookings.add(newSelectedService);
    Get.back();
    pushNewScreen(context, screen: MyBookings(), withNavBar: true);
    Get.snackbar("Success",
        "Your Booking of Service ${selectedService["title"]} is Successfull",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white);
    update();
  }

  @override
  void onInit() {
    dateController.text = DateFormat.yMd().format(DateTime.now());

    timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.onInit();
  }
}
