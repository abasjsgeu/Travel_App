import 'package:flutter/material.dart';

class IconBass extends StatelessWidget {
  const IconBass({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          for (int i = 0; i < 18; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.rotate(
                  angle: 120,
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 10, left: 9.8, right: 20, bottom: 10),
                    child: Opacity(
                      opacity: 0.4,
                      child: Icon(
                        IconData(0xe1d5, fontFamily: 'MaterialIcons'),
                        color: Color.fromARGB(145, 41, 41, 42),
                      ),
                    ),
                  ),
                ),
                for (int i = 0; i < 5; i++)
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 19, bottom: 10, top: 10),
                    child: Transform.rotate(
                      angle: 120,
                      child: const Opacity(
                        opacity: 0.4,
                        child: Icon(
                          IconData(0xe1d5, fontFamily: 'MaterialIcons'),
                          color: Color.fromARGB(145, 41, 41, 42),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
