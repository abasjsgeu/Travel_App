import 'package:flutter/material.dart';
import 'package:travel_app1/core/utils/assets.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/Container_Trips.dart';

class ListviwTrips extends StatefulWidget {
  const ListviwTrips({super.key});

  @override
  State<ListviwTrips> createState() => _ListviwTripsState();
}

class _ListviwTripsState extends State<ListviwTrips> {
  @override
  Widget build(BuildContext context) {
    // var wi = MediaQuery.of(context).size.width;
    List<String> ima = [image5, image4];
    return SizedBox(
      key: UniqueKey(),
      width: 540,
      height: 119,
      child: ListView.builder(
        shrinkWrap: false,

        scrollDirection: Axis.horizontal,
        // shrinkWrap: false,
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container_Itime(
              ima: ima[index],
            ),
          );
        },
      ),
    );
  }
}
