import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:localserviceapp/controller/DashboardController/DashboardController.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _dashBoardController = Get.find<DashboardController>();
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScroller) => [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverSafeArea(
                top: false,
                sliver: SliverAppBar(
                  leading: Container(),
                  floating: true,
                  backgroundColor: Colors.white,
                  expandedHeight: 0.45.sh,
                  titleSpacing: 0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12.w, top: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Discover",
                                  style: TextStyle(fontSize: 38.sp),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  "AVAILABLE SERVICES",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 10.sp,
                                    fontFamily: "Ubuntu",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            height: 200.h,
                            child: CarouselSlider(
                              options: CarouselOptions(
                                  height: 180.h, enlargeCenterPage: true),
                              items: _dashBoardController.listOfBanner.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.lightBlueAccent,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.asset(i, fit: BoxFit.cover),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
          body: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BROWSE ALL",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12.sp,
                      fontFamily: "Ubuntu",
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: new StaggeredGridView.countBuilder(
                      crossAxisCount: 4,
                      itemCount: _dashBoardController.listOfServices.length,
                      itemBuilder: (BuildContext context, int index) =>
                          new Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(_dashBoardController
                                      .listOfServices[index]["color"][0]),
                                  Color(_dashBoardController
                                      .listOfServices[index]["color"][1])
                                ]),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              _dashBoardController.listOfServices[index]
                                  ["title"],
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 25.sp,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      staggeredTileBuilder: (int index) =>
                          new StaggeredTile.count(2, index.isEven ? 2 : 1.5),
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
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
