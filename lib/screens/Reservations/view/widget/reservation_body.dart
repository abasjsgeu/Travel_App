import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:travel_app1/constants.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/appBar2.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/botton_Nav_bar.dart';
import 'package:travel_app1/screens/Reservations/controller/full_book.dart';
import 'package:travel_app1/screens/travel%20page/controller/add_person.dart';
import 'package:travel_app1/screens/travel%20page/model/percon_info.dart';

class ReservationBody extends StatefulWidget {
  const ReservationBody({super.key});

  @override
  State<ReservationBody> createState() => _ReservationBodyState();
}

class _ReservationBodyState extends State<ReservationBody> {
  PersonController n = Get.put(PersonController());

  void initState() {
    CircularProgressIndicator();

    // TODO: implement initState
    if (!n.Initialized.value) {
      // if (n.isloading.value == false)
      //   Center(child: CircularProgressIndicator());

      n.Initialized.value = true;
      n.receve_info_percon();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await n.receve_info_percon();
      },
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Appbar2(
                      icon_back: true,
                      text: '37'.tr,
                      f2: () {
                        Get.back();
                      },
                      f3: () {
                        Get.toNamed('/PagenotifView');
                      },
                      f: () {},
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: ListView_Struture_Reservation())
            ],
          ),
          const BottonNavBar()
        ],
      ),
    );
  }
}

class ListView_Struture_Reservation extends StatelessWidget {
  const ListView_Struture_Reservation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<PersonController>(builder: (controller) {
      if (!controller.isloading.value) {
        return Center(
          child: Padding(
              padding: EdgeInsets.all(20), child: CircularProgressIndicator()),
        );
      }
      if (controller.percon.isEmpty) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
              ),
              Text('No data found'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => controller.receve_info_percon(),
                child: Text('Retry'),
              ),
            ],
          ),
        );
      }
      return Column(
        children: [
          ...List.generate(
            controller.percon.length,
            (index) {
              if (controller.percon.isEmpty == true)
                CircularProgressIndicator();
              final data = controller.percon[index];
              return Padding(
                padding: const EdgeInsets.all(28.0),
                child: InkWell(
                  onTap: () {
                    Get.toNamed('/EditReservationView',
                        arguments: data); // حذف الأقواس المربعة []
                  },
                  child: Struture_Reservation(
                    ind: index,
                    key: ValueKey(controller.percon[index]),
                  ),
                ),
              );
            },
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       n.receve_info_percon();
          //     },
          //     child: Text("adad"))
        ],
      );
    });
  }
}

// ListView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       scrollDirection: Axis.vertical,
//       shrinkWrap: true,
//       itemCount: 3,
//       itemBuilder: (BuildContext context, int index) {
//         return const Padding(
//           padding: EdgeInsets.all(28.0),
//           child: Struture_Reservation(),
//         );
//       },
//     );
class Struture_Reservation extends StatelessWidget {
  const Struture_Reservation({super.key, required this.ind});
  final int ind;
  @override
  Widget build(BuildContext context) {
    PersonController con = Get.find();

    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(78, 0, 0, 0),
              offset: Offset(-12, 15),
              blurRadius: 20)
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          topRight: Radius.elliptical(92, 33),
          topLeft: Radius.circular(23),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "27".tr,
                    style: TextStyle(
                      fontSize: 15,
                      color: colorblue,
                    ),
                  ),
                  Text(
                    "------------",
                    style: TextStyle(
                      fontSize: 20,
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
                    "------------",
                    style: TextStyle(
                      fontSize: 20,
                      color: colorblue,
                    ),
                  ),
                  Text(
                    "26".tr,
                    style: TextStyle(
                      fontSize: 15,
                      color: colorblue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("56".tr),
                Text("55".tr),
                Text("77".tr),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  con.percon[ind].Box!,
                  style: TextStyle(color: colorblue),
                ),
                Text(con.percon[ind].mothername!,
                    style: TextStyle(color: colorblue)),
                Text(con.percon[ind].first_name! + con.percon[ind].lastname!,
                    style: TextStyle(color: colorblue)),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "36".tr.replaceAll(' ', '\n'),
                  style: TextStyle(
                    color: colorblue,
                  ),
                ),
                Text("63".tr, style: TextStyle(color: colorblue)),
                Text("61".tr, style: TextStyle(color: colorblue)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'الأهلي',
                  style: TextStyle(color: colorblue),
                ),
                Text(con.percon[ind].NationaID!,
                    style: TextStyle(color: colorblue)),
                Text(con.percon[ind].mobleNumber!,
                    style: TextStyle(color: colorblue)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("79".tr, style: TextStyle(color: colorblue)),
                const SizedBox(
                  width: 30,
                ),
                Text("78".tr, style: TextStyle(color: colorblue)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('5', style: TextStyle(color: colorblue)),
                const SizedBox(
                  width: 140,
                ),
                Text('2', style: TextStyle(color: colorblue)),
              ],
            ),
            const Divider(
              height: 34,
              color: Colors.blueGrey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: colorblue,
                    ),
                    const Text('27/2'),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.supervisor_account_outlined,
                      color: colorblue,
                      size: 40,
                    ),
                    const Text('1'),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "43".tr,
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
