import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/constants.dart';

class TabBar_View extends StatelessWidget {
  const TabBar_View({
    super.key,
    required this.tabController,
  });
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: TabBarView(controller: tabController, children: [
        ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 18.0),
                child: InkWell(
                  onTap: () {
                    Get.toNamed("/BookFlightView");
                  },
                  child: TabBar_View_Item(
                    date: '5:00',
                  ),
                ),
              ),
            );
          },
        ),
        ListView.builder(
          itemCount: 44,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 18.0),
                child: InkWell(
                  onTap: () {
                    Get.toNamed("/BookFlightView");
                  },
                  child: TabBar_View_Item(
                    date: '9:00',
                  ),
                ),
              ),
            );
          },
        ),
        const Center(
          child: Text("sdSSSSSSSSSSSsd"),
        ),
        const Center(
          child: Text("sdSSSSSSSSSSSsd"),
        ),
        const Center(
          child: Text("sASSSSsd"),
        ),
        const Center(
          child: Text("sdSSSSSSSSSSSsd"),
        ),
        const Center(
          child: Text("sdSSSSJJJJJJJJJJSSSSSSSsd"),
        )
      ]),
    );
  }
}

class TabBar_View_Item extends StatelessWidget {
  const TabBar_View_Item({super.key, required this.date});
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 170,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 20),
              color: const Color.fromARGB(118, 0, 0, 0),
              blurRadius: 40)
        ],
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(248, 243, 238, 238),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "28".tr,
              style: TextStyle(fontFamily: fontType),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "27".tr,
                  style: TextStyle(
                    fontFamily: fontType,
                    fontSize: 15,
                    color: colorblue,
                  ),
                ),
                Text(
                  "--------------",
                  style: TextStyle(
                    fontSize: 12,
                    color: colorblue,
                  ),
                ),
                Icon(
                  color: colorblue,
                  const IconData(
                    0xe1d5,
                    fontFamily: 'MaterialIcons',
                  ),
                ),
                Text(
                  "--------------",
                  style: TextStyle(
                    fontSize: 12,
                    color: colorblue,
                  ),
                ),
                Text(
                  "26".tr,
                  style: TextStyle(
                    fontFamily: fontType,
                    fontSize: 15,
                    color: colorblue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "42".tr,
              style: TextStyle(
                fontFamily: fontType,
                fontSize: 14,
                color: colorblue,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "5.0",
                      style: TextStyle(
                        fontFamily: fontType,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person_2_outlined,
                      color: colorblue,
                    ),
                    Text(
                      "5",
                      style: TextStyle(
                        color: colorblue,
                        fontFamily: fontType,
                      ),
                    )
                  ],
                ),
                Text(
                  "43".tr,
                  style: TextStyle(
                    color: Colors.green,
                    fontFamily: fontType,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
