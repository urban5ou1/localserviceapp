import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localserviceapp/controller/ServiceList/ServiceListController.dart';

class ServicesList extends StatelessWidget {
  ServicesList({@required this.serviceName, @required this.serviceList});
  final dynamic serviceName, serviceList;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ServiceListController>(
            init: ServiceListController(),
            builder: (_serviceController) {
              return Container(
                width: 1.sw,
                height: 1.sh,
                child: Padding(
                  padding: EdgeInsets.only(left: 18.w, top: 10.h),
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
                            "$serviceName",
                            style: TextStyle(fontSize: 28.sp),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      _serviceController.services[serviceList] != null
                          ? Text(
                              "${_serviceController.services[serviceList].length} Services Available",
                              style: TextStyle(fontSize: 16.sp),
                            )
                          : Text(
                              "No Services Available",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                      SizedBox(
                        height: 20.h,
                      ),
                      _serviceController.services[serviceList] != null
                          ? Expanded(
                              child: ListView.separated(
                                  itemBuilder: (context, index) => Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 40.w,
                                            height: 40.h,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: Center(
                                              child: Text(
                                                "${index + 1}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 20.sp,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    _serviceController.services[
                                                            serviceList][index]
                                                        ["title"],
                                                    style: TextStyle(
                                                        color: Colors.indigo,
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w800)),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Text(
                                                  _serviceController
                                                          .services[serviceList]
                                                      [index]["subtitle"],
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Price: ${_serviceController.services[serviceList][index]["price"]}",
                                                      style: TextStyle(
                                                          color: Colors.indigo,
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          bottom: 10.w),
                                                      width: 0.4.sw,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: Colors
                                                                    .black),
                                                        onPressed: () {
                                                          selectDateAndTime(
                                                              _serviceController,
                                                              context,
                                                              _serviceController
                                                                          .services[
                                                                      serviceList]
                                                                  [index]);
                                                        },
                                                        child: Text(
                                                          "Book Now",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                  itemCount: _serviceController
                                      .services[serviceList].length),
                            )
                          : Container(
                              child: Center(
                                child: Text("No service available yet"),
                              ),
                            )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  void selectDateAndTime(
      ServiceListController _serviceController, context, selectedService) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          content: Container(
        height: 0.45.sh,
        child: Column(
          children: <Widget>[
            Text(
              'Choose Date',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5),
            ),
            InkWell(
              onTap: () {
                _serviceController.selectDate(context);
              },
              child: Container(
                height: 50.h,
                margin: EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: TextFormField(
                  style: TextStyle(fontSize: 30.sp),
                  textAlign: TextAlign.center,
                  enabled: false,
                  keyboardType: TextInputType.text,
                  controller: _serviceController.dateController,
                  onSaved: (String val) {
                    _serviceController.setDate = val;
                  },
                  decoration: InputDecoration(
                      disabledBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                      // labelText: 'Time',
                      contentPadding: EdgeInsets.only(top: 0.0)),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              children: <Widget>[
                Text(
                  'Choose Time',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5),
                ),
                InkWell(
                  onTap: () {
                    _serviceController.selectTime(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    height: 50.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: TextFormField(
                      style: TextStyle(fontSize: 30.sp),
                      textAlign: TextAlign.center,
                      onSaved: (String val) {
                        _serviceController.setTime = val;
                      },
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: _serviceController.timeController,
                      decoration: InputDecoration(
                          disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          // labelText: 'Time',
                          contentPadding: EdgeInsets.all(5)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10.w),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () {
                  _serviceController.onServiceBook(selectedService, context);
                },
                child: Text(
                  "Book Now",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
