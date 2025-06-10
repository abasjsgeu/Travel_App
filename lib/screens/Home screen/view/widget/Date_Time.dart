import 'package:flutter/material.dart';
import 'package:travel_app1/constants.dart';

class Date_Time extends StatefulWidget {
  const Date_Time({
    super.key,
    required this.calendar,
    required this.ic,
    required this.text,
    required this.onPress,
  });
  final bool calendar;
  final Icon ic;
  final String text;
  final VoidCallback onPress;
  @override
  State<Date_Time> createState() => _Date_TimeState();
}

class _Date_TimeState extends State<Date_Time> {
  @override
  Widget build(BuildContext context) {
    // DateTime slectedData = DateTime.now();

    return SizedBox(
      width: 240,
      height: 47,
      child: FloatingActionButton(
        heroTag: UniqueKey(),
        backgroundColor: Color.fromARGB(255, 236, 240, 243),
        onPressed: widget.onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              widget.text,
              style: TextStyle(fontFamily: fontType),
            ),
            const SizedBox(
              width: 9,
            ),
            Padding(padding: const EdgeInsets.only(right: 8), child: widget.ic),
          ],
        ),
      ),
    );
  }
}
