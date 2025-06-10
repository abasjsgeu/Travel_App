import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/constants.dart';

class AppbarTravel extends StatefulWidget {
  const AppbarTravel({super.key, required this.tabController});
  final TabController tabController;

  @override
  State<AppbarTravel> createState() => _AppbarTravelState();
}

class _AppbarTravelState extends State<AppbarTravel>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 260,
      color: colorblue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 85,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: IconButton(
              icon: Icon(
                Icons.notifications_none_outlined,
                color: colorwhite,
              ),
              onPressed: () {
                Get.toNamed('/PagenotifView');
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "27".tr,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: fontType,
                  color: colorwhite,
                ),
              ),
              Text(
                "-----------------",
                style: TextStyle(
                  fontSize: 15,
                  color: colorwhite,
                ),
              ),
              const Icon(
                color: Colors.white,
                IconData(
                  0xe1d5,
                  fontFamily: 'MaterialIcons',
                ),
              ),
              Text(
                "-----------------",
                style: TextStyle(
                  fontSize: 15,
                  color: colorwhite,
                ),
              ),
              Text(
                "26".tr,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: fontType,
                  color: colorwhite,
                ),
              ),
            ],
          ),
          // TabBarView(
          //   children: [],
          // ),
          TabBar(
              controller: widget.tabController,
              // textScaler: TextScaler.linear(1),
              labelColor: colorwhite,
              isScrollable: true,
              padding: const EdgeInsets.only(top: 48),
              labelStyle: TextStyle(fontSize: 20, fontFamily: fontType),
              indicatorColor: colorwhite,
              unselectedLabelColor: colorwhite,
              unselectedLabelStyle:
                  TextStyle(fontSize: 10, fontFamily: fontType),
              tabs: [
                Tab(
                  text: "1${"v".tr}",
                ),
                Tab(
                  // height: 84,
                  text: "2${"v".tr}",
                ),
                Tab(
                  text: "3${"v".tr}",
                ),
                Tab(
                  text: "4${"v".tr}",
                ),
                Tab(
                  text: "5${"v".tr}",
                ),
                Tab(
                  text: "6${"v".tr}",
                ),
                Tab(
                  text: "7${"v".tr}",
                )
              ]),
        ],
      ),
    );
  }
}
