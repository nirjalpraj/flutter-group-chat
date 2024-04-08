import 'package:flutter/material.dart';

Color myColor = Color(0xfffff0e6);

class Welcome_Group_Chat extends StatelessWidget {
  const Welcome_Group_Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Card(
          elevation: 0,
          color: myColor,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Text(
                  '🌟 Welcome to the dynamic Group Chat for Course 1 & 2 participants! 🌟',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '🌈 Once you have successfully completed your course, you will be seamlessly transitioned to the respective group chat for your next adventure. It is all about progression and moving forward together.',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
