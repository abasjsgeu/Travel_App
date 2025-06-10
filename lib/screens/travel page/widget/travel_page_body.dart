import 'package:flutter/material.dart';
import 'package:travel_app1/screens/travel%20page/widget/TabBar_View_Item.dart';
import 'package:travel_app1/screens/travel%20page/widget/appBar_travel.dart';

class TravelPageBody extends StatefulWidget {
  const TravelPageBody({super.key});

  @override
  State<TravelPageBody> createState() => _TravelPageBodyState();
}

class _TravelPageBodyState extends State<TravelPageBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 7, vsync: this);
    // tabController.addListener(() {
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              AppbarTravel(
                tabController: tabController,
              ),
              TabBar_View(
                tabController: tabController,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
