import 'package:flutter/material.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/Best_Rate.dart';

class Listview_BestRate extends StatefulWidget {
  const Listview_BestRate({super.key});

  @override
  State<Listview_BestRate> createState() => _Listview_BestRateState();
}

class _Listview_BestRateState extends State<Listview_BestRate> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // key: UniqueKey(),

      // physics: NeverScrollableScrollPhysics(),
      // shrinkWrap: false,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 20,
        );
      },
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return const Best_Rate();
      },
    );
  }
}
